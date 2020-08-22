import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vcnahistoria/models/tile_facts.dart';


class DataController extends GetxController {

  TileFacts tileFacts;
  List<TileFacts> facts = [];
  GetStorage getStorage;

  void setFacts(){
    facts.sort((a, b){
      return a.date.compareTo(b.date);
    });
  }

  void addFact(TileFacts newFact){
    facts.add(newFact);
    update();
  }

  void removeFact(int index){
    facts.removeAt(index);
    update();
  }


  Future<void> saveData() async{

    final List<Map<String, dynamic>> dados = [];

    for(final fact in facts){
      dados.add(tileFacts.toMap(fact));
    }

    final data = json.encode(dados);
    await getStorage.write('data', data);
  }

  Future<void> readData() async{
    facts.clear();
    final data = await getStorage.read('data');
    json.decode(data as String);
    for(final fact in data){
      facts.add(TileFacts.fromMap(fact as Map<String, dynamic>));
    }
    update();
  }

  
  
}