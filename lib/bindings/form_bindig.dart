import 'package:get/get.dart';
import 'package:vcnahistoria/controllers/form_controller.dart';

class FormBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FormController(), permanent: true,);
  }

}