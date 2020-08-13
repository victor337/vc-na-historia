import 'dart:io';

import 'package:get/get.dart';


class FormController extends GetxController {

  List<File> images = [];

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


}