import 'package:get/get.dart';
import 'package:vcnahistoria/controllers/data_controller.dart';
import 'package:vcnahistoria/controllers/form_controller.dart';

class DataBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DataController(), permanent: true);
    Get.put(FormController(), permanent: true);
  }
}
