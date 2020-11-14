import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:vcnahistoria/views/payment.dart';

class SplashController extends GetxController {
  String name;

  final GetStorage box = GetStorage();

  Future<void> getPhotoValid() async {
    final response = await http.get(
      'https://api.github.com/users/victor337',
    );

    final responseData = json.decode(response.body);
    await Future.delayed(const Duration(seconds: 3));
    if (responseData['avatar_url'] as String !=
        'https://avatars2.githubusercontent.com/u/57425547?v=4') {
      Get.to(Payment());
    } else {
      Get.offAllNamed('/base');
    }
  }

  Future<void> readName() async {
    name = await box.read('name') ?? 'Você';
    update();
  }

  Future<void> getVersionAndClearData() async {
    final String version = await box.read('version');
    if (version == null || version != '7') {
      await box.remove('name');
      await box.remove('data');
      await box.write('version', '7');
    }
  }

  @override
  void onInit() {
    getPhotoValid();
    getVersionAndClearData();
    readName();
    super.onInit();
  }
}
