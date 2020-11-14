import 'package:flutter/cupertino.dart';

class TileFacts {
  String date;
  String saveData;
  String fact;
  String character;
  List<dynamic> images;
  String localDetails;
  String color;
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
    @required this.localDetails,
    @required this.color,
  });

  TileFacts.fromMap(final Map<String, dynamic> data) {
    color = data['color'] as String;
    date = data['date'] as String;
    saveData = data['saveData'] as String;
    fact = data['fact'] as String;
    character = data['character'] as String;
    images = data['images'] as List<dynamic> ?? [];
    details = data['details'] as String;
    tyme = data['tyme'] as String;
    localDetails = data['localDetails'] as String;
    localDrop = data['localDrop'] as String;
  }
}
