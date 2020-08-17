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

  String details;
  void setdetails(String newdetails){
    details = newdetails;
    update();
  }

  void cleanAll(){
    images = [];
    data = null;
    fato = null;
    person = null;
    local = null;
    details = null;
    update();
  }

  bool isValid(){
    return data != null && data != '' && fato != null && 
      fato != '' && person != null && person != '' && 
      local != null && local != '' && details != null && details != '';
  }

}