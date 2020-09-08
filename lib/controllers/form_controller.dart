import 'dart:io';
import 'package:get/get.dart';


class FormController extends GetxController {

  List<String> images = [];

  bool isLoadingImages = false;
  void setLoadingImages(){
    isLoadingImages = !isLoadingImages;
    update();
  }

  void addImageAccount(File file){
    images.add(file.path);
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

  String details;
  void setdetails(String newdetails){
    details = newdetails;
    update();
  }

  String tyme = 'D.C.';
  void setTyme(String settyme){
    tyme = settyme;
    update();
  }

  String localDrop;
  void setlocalDrop(String setlocalDrop){
    localDrop = setlocalDrop;
    update();
  }

  void cleanAll(){
    images = [];
    data = null;
    fato = null;
    person = null;
    details = null;
    tyme = null;
    localDrop = 'Selecione';
    update();
  }

  bool isValid(){
    return data != null && data != '' && fato != null && 
      fato != '' && person != null && person != '' && 
      details != null && details != '' &&
      localDrop != 'Selecione';
  }

}