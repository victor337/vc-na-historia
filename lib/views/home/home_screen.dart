import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vcnahistoria/common/custom_drawer.dart';
import 'package:vcnahistoria/controllers/base_controller.dart';
import 'package:vcnahistoria/controllers/data_controller.dart';
import 'package:vcnahistoria/controllers/form_controller.dart';
import 'package:vcnahistoria/models/tile_facts.dart';
import 'package:vcnahistoria/views/home/components/form_all.dart';
import 'package:vcnahistoria/views/home/components/photos_fomr.dart';

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
                style: TextStyle(color: Colors.white),
              ),
              GetBuilder<BaseController>(
                builder: (baseController) {
                  return GetBuilder<DataController>(
                    builder: (dataController) {
                      return GetBuilder<FormController>(
                        builder: (formControll) {
                          return FlatButton(
                            onPressed: () {
                              print(formControll.selectedColor.alpha);
                              print(formControll.selectedColor.red);
                              print(formControll.selectedColor.green);
                              print(formControll.selectedColor.blue);
                              if (formControll.isValid()) {
                                final TileFacts newFact = TileFacts(
                                  tyme: formControll.tyme,
                                  date: formControll.data,
                                  saveData: DateTime.now().toString(),
                                  fact: formControll.fato,
                                  localDetails: formControll.localdetails,
                                  character: formControll.person,
                                  images: formControll.images,
                                  color: formControll.colordrop,
                                  details: formControll.details,
                                  localDrop: formControll.localDrop,
                                  myColor: ColorMySelect(
                                    a: formControll.selectedColor.alpha,
                                    r: formControll.selectedColor.red,
                                    g: formControll.selectedColor.green,
                                    b: formControll.selectedColor.blue,
                                  ),
                                );

                                dataController.addFact(newFact);
                                baseController.setPage(0);
                                formControll.cleanAll();
                              } else {
                                Get.dialog(
                                  AlertDialog(
                                    title: const Text('Atenção'),
                                    content: const Text(
                                      'Todos os campos devem ser preenchidos.',
                                    ),
                                    actions: [
                                      FlatButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: const Text('Ok'),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                            child: const Text(
                              'Salvar',
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        },
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
            child: GetBuilder<FormController>(
              init: FormController(),
              builder: (formController) {
                return ListView(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                  children: [
                    FormAll(),
                    const SizedBox(
                      height: 15,
                    ),
                    PhotosForm(),
                  ],
                );
              },
            )),
      ),
    );
  }
}
