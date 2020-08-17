import 'package:get/get.dart';
import 'package:vcnahistoria/models/tile_facts.dart';


class DataController extends GetxController {

  List<TileFacts> facts = [];

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
  
}