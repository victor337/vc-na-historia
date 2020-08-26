import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vcnahistoria/models/tile_facts.dart';


class DataController extends GetxController {

  TileFacts tileFacts;
  List<TileFacts> facts = [];

  GetStorage box = GetStorage();

  void setFacts(){
    facts.sort((a, b){
      return a.date.compareTo(b.date);
    });
  }

  void addFact(TileFacts newFact){
    facts.add(newFact);
    saveData();
    update();
  }

  void removeFact(int index){
    facts.removeAt(index);
    saveData();
    update();
  }


  Future<void> saveData() async{

    final List<Map<String, dynamic>> dados = [];
    final List<String> imagesPath = [];

    for(final fact in facts){

      for(final file in fact.images){
        imagesPath.add(file as String);
      }

      final Map<String, dynamic> map = {
        'date': fact.date,
        'saveData': fact.saveData,
        'fact': fact.fact,
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

  Future<void> readData() async{
    facts.clear();
    final data = await box.read('data')??[];
    
    for(final fact in data){
      facts.add(TileFacts.fromMap(fact as Map<String, dynamic>));
    }
    update();
  }

  @override
  void onInit() {
    readData();
    super.onInit();
  }
  
}