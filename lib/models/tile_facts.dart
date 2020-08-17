import 'dart:io';

import 'package:flutter/cupertino.dart';

class TileFacts {

  String date;
  String saveData;
  String fact;
  String character;
  String local;
  List<File> images;
  String details;

  TileFacts({
    @required this.date,
    @required this.saveData,
    @required this.fact,
    @required this.character,
    @required this.local,
    @required this.images,
    @required this.details,
  });


}