import 'dart:io';

import 'package:get/get.dart';
import 'package:vcnahistoria/models/tile_facts.dart';


class FormController extends GetxController {

  List<File> images = [];
  List<TileFacts> facts = [];

  void addFact(TileFacts newFact){
    facts.add(newFact);
    update();
  }

  void removeFact(int index){
    facts.removeAt(index);
    update();
  }

  bool isLoadingImages = false;
  void setLoadingImages(){
    isLoadingImages = !isLoadingImages;
    update();
  }

  void addImageAccount(File file){
    images.add(file);
    update();
  }

  void removeImage(int index){
    images.removeAt(index);
    update();
  }
  
  String data;
  void setData(String newData){
    data = newData;
    update();
  }

  String fato;
  void setfato(String newfato){
    fato = newfato;
    update();
  }

  String person;
  void setperson(String newperson){
    person = newperson;
    update();
  }

  String local;
  void setlocal(String newlocal){
    local = newlocal;
    update();
  }

  void cleanAll(){
    images = [];
    data = '';
    fato = '';
    person = '';
    local = '';
    update();
  }

}