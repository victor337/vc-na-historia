import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vcnahistoria/models/tile_facts.dart';

class DataController extends GetxController {
  TileFacts tileFacts;
  List<TileFacts> facts = [];

  List<TileFacts> factsFiltered = [];

  String filter = '';
  void setFilter(String newFilter) {
    filter = newFilter;
    if (filter == null || filter == '') {
      factsFiltered.clear();
      update();
    } else if (filter.length > 2) {
      factsFiltered.clear();
      factsFiltered.addAll(facts.where((element) =>
          element.fact.toLowerCase().contains(filter.toLowerCase())));
      factsFiltered.addAll(facts.where((element) =>
          element.localDrop.toLowerCase().contains(filter.toLowerCase())));
      factsFiltered.addAll(facts.where((element) =>
          element.localDetails.toLowerCase().contains(filter.toLowerCase())));
      factsFiltered.addAll(facts.where((element) =>
          element.saveData.toLowerCase().contains(filter.toLowerCase())));
      factsFiltered.addAll(facts.where((element) => element.date
          .toString()
          .toLowerCase()
          .contains(filter.toLowerCase())));
      factsFiltered.addAll(facts.where((element) =>
          element.character.toLowerCase().contains(filter.toLowerCase())));
      factsFiltered.addAll(facts.where((element) =>
          element.tyme.toLowerCase().contains(filter.toLowerCase())));
      factsFiltered.addAll(facts.where((element) =>
          element.details.toLowerCase().contains(filter.toLowerCase())));
      update();
    }
  }

  void setFactsFilter() {
    factsFiltered.sort((a, b) {
      final int aDay = int.parse(a.date.substring(0, 2));
      final int aMonth = int.parse(a.date.substring(3, 5));
      int aYear = int.parse(a.date.substring(6, 10));

      if (a.tyme == 'A.C.') {
        aYear = int.parse('-$aYear');
      }

      final DateTime aDate = DateTime(aYear, aMonth, aDay);

      final int bDay = int.parse(b.date.substring(0, 2));
      final int bMonth = int.parse(b.date.substring(3, 5));
      int bYear = int.parse(b.date.substring(6, 10));

      if (b.tyme == 'A.C.') {
        bYear = int.parse('-$bYear');
      }

      final DateTime bDate = DateTime(bYear, bMonth, bDay);

      return aDate.compareTo(bDate);
    });
  }

  GetStorage box = GetStorage();

  String name;

  void removeImageFromIndex(int factsTile, int indexFact) {
    facts[factsTile].images.removeAt(indexFact);
    update();
    saveData();
  }

  //Editar fact
  Future<void> editFactIndex({
    @required int factsTile,
    @required TileFacts newFact,
  }) async {
    facts[factsTile].character = newFact.character;
    facts[factsTile].date = newFact.date;
    facts[factsTile].details = newFact.details;
    facts[factsTile].fact = newFact.fact;
    facts[factsTile].color = newFact.color;
    facts[factsTile].images.clear();
    for (final image in newFact.images ?? []) {
      facts[factsTile].images.add(image);
    }
    facts[factsTile].localDrop = newFact.localDrop;
    facts[factsTile].saveData = newFact.saveData;
    facts[factsTile].tyme = newFact.tyme;
    await saveData();
    update();
  }

  bool imageLoading = false;
  void setLoadingImages() {
    imageLoading = !imageLoading;
    update();
  }

  Future<void> setName(String setname) async {
    name = setname;
    await box.write('name', setname);
    update();
  }

  Future<void> addImageFromIndex(int factsTileIndex, File image) async {
    facts[factsTileIndex].images.add(image.path);
    update();
    await saveData();
  }

  Future<void> readName() async {
    name = await box.read('name') ?? 'Você';
    update();
  }

  void setFacts() {
    facts.sort((a, b) {
      final int aDay = int.parse(a.date.substring(0, 2));
      final int aMonth = int.parse(a.date.substring(3, 5));
      int aYear = int.parse(a.date.substring(6, 10));

      if (a.tyme == 'A.C.') {
        aYear = int.parse('-$aYear');
      }

      final DateTime aDate = DateTime(aYear, aMonth, aDay);

      final int bDay = int.parse(b.date.substring(0, 2));
      final int bMonth = int.parse(b.date.substring(3, 5));
      int bYear = int.parse(b.date.substring(6, 10));

      if (b.tyme == 'A.C.') {
        bYear = int.parse('-$bYear');
      }

      final DateTime bDate = DateTime(bYear, bMonth, bDay);

      return aDate.compareTo(bDate);
    });
  }

  Future<void> addFact(TileFacts newFact) async {
    facts.add(newFact);
    await saveData();
    update();
  }

  Future<void> removeFact(int index) async {
    facts.removeAt(index);
    await saveData();
    update();
  }

  Future<void> saveData() async {
    final List<Map<String, dynamic>> dados = [];
    for (final fact in facts) {
      final Map<String, dynamic> map = {
        'date': fact.date,
        'saveData': fact.saveData,
        'fact': fact.fact,
        'color': fact.color,
        'localDetails': fact.localDetails,
        'character': fact.character,
        'images': fact.images,
        'details': fact.details,
        'tyme': fact.tyme,
        'localDrop': fact.localDrop,
      };
      dados.add(map);
    }

    await box.write('data', dados);
  }

  Future<void> readData() async {
    facts.clear();
    final data = await box.read('data') ?? [];

    for (final fact in data) {
      facts.add(TileFacts.fromMap(fact as Map<String, dynamic>));
    }
    update();
  }

  @override
  void onInit() {
    readData();
    readName();
    super.onInit();
  }
}
