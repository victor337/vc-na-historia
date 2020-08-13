
import 'package:flutter/material.dart';
import 'package:vcnahistoria/views/home/components/form_all.dart';
import 'package:vcnahistoria/views/home/components/photos_fomr.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffe33030),
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text(
                'Adicionar',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ],
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffe33030),
                Color(0xffff4f4f),
              ]
            ),
          ),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
            children: [
              FormAll(),
              const SizedBox(height: 15,),
              PhotosForm(),
            ],
          ),
        ),
      ),
    );
  }
}