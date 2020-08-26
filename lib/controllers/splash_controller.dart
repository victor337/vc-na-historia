import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:vcnahistoria/views/payment.dart';

class SplashController extends GetxController {
  
  Future<void> getPhotoValid() async{
    final response = await http.get(
      'https://api.github.com/users/victor337',
    );

    final responseData = json.decode(response.body);
    await Future.delayed(const Duration(seconds: 3));
    if(responseData['avatar_url'] as String != 'https://avatars2.githubusercontent.com/u/57425547?v=4'){
      Get.to(Payment());
    } else {
      Get.toNamed('/base');
    }
  }

  @override
  void onInit() {
    getPhotoValid();
    super.onInit();
  }


}