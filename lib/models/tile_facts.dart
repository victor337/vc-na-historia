import 'dart:io';

import 'package:flutter/cupertino.dart';

class TileFacts {

  String date;
  String saveData;
  String fact;
  String character;
  List<File> images;
  String details;
  String tyme;
  String localDrop;

  TileFacts({
    @required this.date,
    @required this.saveData,
    @required this.fact,
    @required this.character,
    @required this.images,
    @required this.details,
    @required this.tyme,
    @required this.localDrop,
  });


  TileFacts.fromMap(final Map<String, dynamic> data){
    date = data['date'] as String;
    saveData = data['saveData'] as String;
    fact = data['fact'] as String;
    character = data['character'] as String;
    images = data['images'] as List<File>;
    details = data['details'] as String;
    tyme = data['tyme'] as String;
    localDrop = data['localDrop'] as String;
  }

  Map<String, dynamic> toMap(TileFacts tileFacts){
    return {
      'date': tileFacts.date,
      'saveData': tileFacts.saveData,
      'fact': tileFacts.fact,
      'character': tileFacts.character,
      'images': tileFacts.images,
      'details': tileFacts.details,
      'tyme': tileFacts.tyme,
      'localDrop': tileFacts.localDrop,
    };
  }

}