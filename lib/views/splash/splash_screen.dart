import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vcnahistoria/controllers/splash_controller.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 4,
                child: const FadeInImage(
                  fadeInDuration: Duration(milliseconds: 500),
                  placeholder: AssetImage(
                    'assets/transparent.png'
                  ),
                  image: AssetImage('assets/history.png'),
                  fit: BoxFit.contain,
                ),
              ),
              GetBuilder<SplashController>(
                init: SplashController(),
                builder: (splashController){
                  return Text(
                    '${splashController.name} na história',
                    style: const TextStyle(
                      fontSize: 20
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}