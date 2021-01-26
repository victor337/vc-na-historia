import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FormController extends GetxController {
  Color selectedColor = Colors.lightGreen[300];
  void setSelectedColor(Color value) {
    selectedColor = value;
    update();
  }

  GetStorage box = GetStorage();

  List<String> images = [];

  bool isLoadingImages = false;
  void setLoadingImages() {
    isLoadingImages = !isLoadingImages;
    update();
  }

  void addImageAccount(File file) {
    images.add(file.path);
    update();
  }

  void removeImage(int index) {
    images.removeAt(index);
    update();
  }

  String data;
  void setData(String newData) {
    data = newData;
    update();
  }

  String fato;
  void setfato(String newfato) {
    fato = newfato;
    update();
  }

  String person;
  void setperson(String newperson) {
    person = newperson;
    update();
  }

  String localdetails;
  void setlocaldetails(String newlocaldetails) {
    localdetails = newlocaldetails;
    update();
  }

  String details;
  void setdetails(String newdetails) {
    details = newdetails;
    update();
  }

  String tyme;
  void setTyme(String settyme) {
    tyme = settyme;
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

  void cleanAll() {
    images = [];
    data = null;
    fato = null;
    person = null;
    details = null;
    tyme = null;
    localdetails = null;
    localDrop = 'Selecione';
    update();
  }

  bool isValid() {
    return data != null &&
        tyme != 'Selecione' &&
        tyme != null &&
        localdetails != null &&
        data != '' &&
        fato != null &&
        fato != '' &&
        person != null &&
        person != '' &&
        details != null &&
        details != '' &&
        localDrop != 'Selecione';
  }
}
