
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vcnahistoria/controllers/form_controller.dart';
import 'package:vcnahistoria/models/tile_facts.dart';
import 'package:vcnahistoria/views/historic/historic_screen.dart';
import 'package:vcnahistoria/views/home/components/form_all.dart';
import 'package:vcnahistoria/views/home/components/photos_fomr.dart';
import 'package:vcnahistoria/views/home/components/preview.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffe33030),
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Adicionar',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              GetBuilder<FormController>(
                init: FormController(),
                builder: (formControll){
                  return FlatButton(
                    onPressed: (){

                      final TileFacts newFact = TileFacts(
                        date: formControll.data,
                        saveData: DateTime.now().toString(),
                        fact: formControll.fato,
                        character: formControll.person,
                        local: formControll.local,
                        images: formControll.images
                      );

                      formControll.addFact(newFact);

                      Get.to(HistoricScreen());
                    },
                    child: const Text(
                      'Salvar',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  );
                },
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
              const SizedBox(height: 15,),
              Preview(),
            ],
          ),
        ),
      ),
    );
  }
}