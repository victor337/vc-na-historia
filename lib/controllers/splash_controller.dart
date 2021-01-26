import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:vcnahistoria/views/payment.dart';

class SplashController extends GetxController {
  String name;

  final GetStorage box = GetStorage();

  Future<void> getPhotoValid() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAllNamed('/base');
  }

  Future<void> readName() async {
    name = await box.read('name') ?? 'Você';
    update();
  }

  @override
  void onInit() {
    getPhotoValid();
    readName();
    super.onInit();
  }
}
