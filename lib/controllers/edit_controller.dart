import 'package:get/get.dart';

class EditController extends GetxController {

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


}