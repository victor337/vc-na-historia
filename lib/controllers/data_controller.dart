import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vcnahistoria/models/tile_facts.dart';


class DataController extends GetxController {

  TileFacts tileFacts;
  List<TileFacts> facts = [];
  
  List<TileFacts> factsFiltered = [];

  String filter = '';
  void setFilter(String newFilter){
    filter = newFilter;
    if(filter == null || filter == ''){
      factsFiltered.clear();
    }
    update();
    filterFacts();
  }

  void filterFacts(){
    factsFiltered.clear();
    if(filter != null && filter != ''){
      for(final fact in facts){
        if( 
          fact.fact.toLowerCase().contains(filter.toLowerCase()) ||
          fact.localDrop.toLowerCase().contains(filter.toLowerCase()) ||
          fact.saveData.toLowerCase().contains(filter.toLowerCase()) ||
          fact.tyme.toLowerCase().contains(filter.toLowerCase()) ||
          fact.character.toLowerCase().contains(filter.toLowerCase()) ||
          fact.date.toString().toLowerCase().contains(filter.toLowerCase()) ||
          fact.details.toLowerCase().contains(filter.toLowerCase())
        ){
          factsFiltered.add(fact);
        }
      }
    }
    update();
  }

  void setFactsFilter(){
    factsFiltered.sort((a, b){
      return a.date.compareTo(b.date);
    });
  }

  GetStorage box = GetStorage();

  String name;

  
  void removeImageFromIndex(int factsTile, int indexFact){
    facts[factsTile].images.removeAt(indexFact);
    update();
    saveData();
  }

  //Editar fact
  void editFactIndex({@required int factsTile, @required TileFacts newFact}){
    facts[factsTile].character = newFact.character;
    facts[factsTile].date = newFact.date;
    facts[factsTile].details = newFact.details;
    facts[factsTile].fact = newFact.fact;
    facts[factsTile].images.clear();
    for(final image in newFact.images??[]){
      facts[factsTile].images.add(image);
    }
    facts[factsTile].localDrop = newFact.localDrop;
    facts[factsTile].saveData = newFact.saveData;
    facts[factsTile].tyme = newFact.tyme;    
    update();
    saveData();
  }

  bool imageLoading = false;
  void setLoadingImages(){
    imageLoading = !imageLoading;
    update();
  }

  void setName(String setname){
    name = setname;
    box.write('name', setname);
    update();
  }
  void addImageFromIndex(int factsTileIndex, File image){
    facts[factsTileIndex].images.add(image.path);
    update();
    saveData();
  }

  void readName(){
    name = box.read('name')??'Você';
    update();
  }

  void setFacts(){
    facts.sort((a, b){
      return a.date.compareTo(b.date);
    });
  }

  void addFact(TileFacts newFact){
    facts.add(newFact);
    saveData();
    update();
  }

  void removeFact(int index){
    facts.removeAt(index);
    saveData();
    update();
  }


  Future<void> saveData() async{

    final List<Map<String, dynamic>> dados = [];
    final List<String> imagesPath = [];

    for(final fact in facts){

      for(final file in fact.images){
        imagesPath.add(file as String);
      }

      final Map<String, dynamic> map = {
        'date': fact.date,
        'saveData': fact.saveData,
        'fact': fact.fact,
        'character': fact.character,
        'images': fact.images,
        'details': fact.details,
        'tyme': fact.tyme,
        'localDrop': fact.localDrop,
      };
      dados.add(map);
    }
    
    await box.write('data', dados);
  }

  Future<void> readData() async{
    facts.clear();
    final data = await box.read('data')??[];
    
    for(final fact in data){
      facts.add(TileFacts.fromMap(fact as Map<String, dynamic>));
    }
    update();
  }

  @override
  void onInit() {
    readData();
    readName();
    super.onInit();
  }
  
}