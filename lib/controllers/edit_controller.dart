import 'dart:io';

import 'package:get/get.dart';

class EditController extends GetxController {

  List<String> images = [];

  void initImages(List<dynamic> imagesEdit){
    images.clear();
    for(final image in imagesEdit){
      images.add(image as String);
    }
    update();
  }

  void addImageAccount(File path){
    images.add(path.path);
    update();
  }

  void removeImage(int index){
    images.removeAt(index);
    update();
  }

  bool isLoadingImages = false;

  void setLoading(){
    isLoadingImages = !isLoadingImages;
    update();
  }

  String fact;
  void setFact(String value){
    fact = value;
    update();
  }

  String character;
  void setcharacter(String value){
    character = value;
    update();
  }

  String date;
  void setdate(String value){
    date = value;
    update();
  }

  String local;
  void setlocal(String value){
    local = value;
    update();
  }

  String details;
  void setdetails(String value){
    details = value;
    update();
  }


  String tyme;
  void settyme(String value){
    tyme = value;
    update();
  }


}