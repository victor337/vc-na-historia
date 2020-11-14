import 'dart:io';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vcnahistoria/controllers/data_controller.dart';
import 'package:vcnahistoria/controllers/edit_controller.dart';
import 'package:vcnahistoria/models/tile_facts.dart';
import 'package:vcnahistoria/views/details/components/details_widget.dart';
import 'package:vcnahistoria/views/details/components/view_the_photo.dart';
import 'package:vcnahistoria/views/edit/edit_screen.dart';

class DetailsScreen extends StatelessWidget {
  final TileFacts tileFacts;
  final int index;
  DetailsScreen(this.tileFacts, this.index);

  final EditController controller = Get.put(EditController());

  @override
  Widget build(BuildContext context) {
    String setDate(String date) {
      final String year = date.substring(0, 4);
      final String month = date.substring(6, 7);
      final String day = date.substring(8, 10);
      return '$day/$month/$year';
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 30, 30),
      appBar: AppBar(
        elevation: 0,
        title: Text('Detalhes: ${tileFacts.fact}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.grey),
            onPressed: () {
              Get.to(EditScreen(tileFacts, index));
              controller.initImages(tileFacts.images);
            },
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        color: const Color.fromARGB(255, 30, 30, 30),
        child: GetBuilder<DataController>(
          builder: (dataController) {
            return ListView(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              children: [
                const Text(
                  'Clique na foto para ampliar',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                Container(
                    height: 200,
                    child: tileFacts.images.isNotEmpty
                        ? Carousel(
                            autoplay: false,
                            dotColor: const Color.fromARGB(255, 30, 30, 30),
                            dotBgColor: Colors.transparent,
                            images: tileFacts.images
                                .map(
                                  (e) => GestureDetector(
                                    onTap: () {
                                      Get.to(ViewThePhoto(e as String));
                                    },
                                    child: Image.file(
                                      File(e as String),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                                .toList())
                        : const Center(
                            child: Text(
                              'Não há fotos adicionadas',
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            DetailsWidget(title: 'Fato', value: tileFacts.fact),
                            DetailsWidget(
                                title: 'Personagem',
                                value: tileFacts.character),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            DetailsWidget(
                              title: 'Data',
                              value: tileFacts.date.toString(),
                              tyme: tileFacts.tyme,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            DetailsWidget(
                                title: 'Local',
                                value: tileFacts.localDrop.toString()),
                            DetailsWidget(
                                title: 'Detalhes', value: tileFacts.details),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Última modificação em: ${setDate(tileFacts.saveData)}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                RaisedButton(
                  color: Colors.red,
                  onPressed: () {
                    Get.dialog(AlertDialog(
                      title: const Text('Atenção'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('Realmente deseja apagar?'),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RaisedButton(
                                color: Colors.red,
                                onPressed: () {
                                  dataController.removeFact(index);
                                  Get.back();
                                  Get.back();
                                },
                                child: const Text(
                                  'Sim',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              RaisedButton(
                                color: Colors.blue,
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text(
                                  'Não',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ));
                  },
                  child: const Text(
                    'Apagar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
