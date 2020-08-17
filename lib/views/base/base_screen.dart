import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vcnahistoria/controllers/base_controller.dart';
import 'package:vcnahistoria/views/historic/historic_screen.dart';
import 'package:vcnahistoria/views/home/home_screen.dart';


class BaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<BaseController>(
          init: BaseController(),
          builder: (baseController){
            if(baseController.page == 0){
              return HistoricScreen();
            } else if(baseController.page == 1){
              return HomeScreen();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}