import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vcnahistoria/bindings/data_bindig.dart';
import 'package:vcnahistoria/views/base/base_screen.dart';
import 'package:vcnahistoria/views/splash/splash_screen.dart';

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 30, 30, 30),
        fontFamily: 'VarelaRound'
      ),
      defaultTransition: Transition.topLevel,
      getPages: [
        GetPage(
          name: '/splash', page: () => SplashScreen(),
          binding: DataBinding()
        ),
        GetPage(
          name: '/base', page: () => BaseScreen(),
          binding: DataBinding()
        ),
      ],
    ),
  );
}