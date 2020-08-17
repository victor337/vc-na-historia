import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vcnahistoria/views/base/base_screen.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
              const Text(
                'Você na história',
                style: TextStyle(
                  fontSize: 20
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value){
      Get.to(BaseScreen());
    });
    super.initState();
  }

}