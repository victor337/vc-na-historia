import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditController extends GetxController {
  Color selectedColor;
  void setSelectedColor(Color value) {
    selectedColor = value;
    update();
  }

  List<String> images = [];

  void initImages(List<dynamic> imagesEdit) {
    images.clear();
    for (final image in imagesEdit) {
      images.add(image as String);
    }
    update();
  }

  void addImageAccount(File path) {
    images.add(path.path);
    update();
  }

  void removeImage(int index) {
    images.removeAt(index);
    update();
  }

  bool isLoadingImages = false;

  void setLoading() {
    isLoadingImages = !isLoadingImages;
    update();
  }

  String localdetails;
  void setlocaldetails(String newlocaldetails) {
    localdetails = newlocaldetails;
    update();
  }

  String fact;
  void setFact(String value) {
    fact = value;
    update();
  }

  String character;
  void setcharacter(String value) {
    character = value;
    update();
  }

  String date;
  void setdate(String value) {
    date = value;
    update();
  }

  String colordrop;
  void setcolor(String color) {
    colordrop = color;
    update();
  }

  String localDrop;
  void setlocalDrop(String setlocalDrop) {
    localDrop = setlocalDrop;
    update();
  }

  String details;
  void setdetails(String value) {
    details = value;
    update();
  }

  String tyme;
  void settyme(String value) {
    tyme = value;
    update();
  }
}
