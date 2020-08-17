
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vcnahistoria/common/custom_drawer.dart';
import 'package:vcnahistoria/controllers/base_controller.dart';
import 'package:vcnahistoria/controllers/form_controller.dart';
import 'package:vcnahistoria/models/tile_facts.dart';
import 'package:vcnahistoria/views/home/components/form_all.dart';
import 'package:vcnahistoria/views/home/components/photos_fomr.dart';
import 'package:vcnahistoria/views/home/components/preview.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 30, 30, 30),
        drawer: CustomDrawer(),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 30, 30, 30),
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
              GetBuilder<BaseController>(
                builder: (baseController){
                  return GetBuilder<FormController>(
                builder: (formControll){
                  return FlatButton(
                    onPressed: (){
                      if(formControll.isValid()){
                        final TileFacts newFact = TileFacts(
                          date: formControll.data,
                          saveData: DateTime.now().toString(),
                          fact: formControll.fato,
                          character: formControll.person,
                          local: formControll.local,
                          images: formControll.images,
                          details: formControll.details,
                        );

                        formControll.addFact(newFact);
                        formControll.cleanAll();
                        baseController.setPage(0);
                      } else {
                        Get.dialog(
                          AlertDialog(
                            title: const Text('Atenção'),
                            content: const Text('Todos os campos devem ser preenchidos.'),
                            actions: [
                              FlatButton(
                                onPressed: (){
                                  Get.back();
                                },
                                child: const Text('Ok')
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Salvar',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  );
                },
              );
                },
              ),
            ],
          ),
        ),
        body: Container(
          color: const Color.fromARGB(255, 30, 30, 30),
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