import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vcnahistoria/bindings/form_bindig.dart';
import 'package:vcnahistoria/views/base/base_screen.dart';

void main() {
  runApp(
    GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/base',
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 30, 30, 30),
          fontFamily: 'VarelaRound'
        ),
        defaultTransition: Transition.topLevel,
        getPages: [
          GetPage(
            name: '/base', page: () => BaseScreen(),
            binding: FormBinding()
          )
        ],
    )
  );
}