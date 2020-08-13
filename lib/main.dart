import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vcnahistoria/views/home/home_screen.dart';

void main() {
  runApp(
    GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        theme: ThemeData(
          primaryColor: Colors.red,
          fontFamily: 'VarelaRound'
        ),
        defaultTransition: Transition.size,
        getPages: [
          GetPage(name: '/home', page: () => HomeScreen())
        ],
    )
  );
}