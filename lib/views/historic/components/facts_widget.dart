import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vcnahistoria/controllers/data_controller.dart';
import 'package:vcnahistoria/models/tile_facts.dart';
import 'package:vcnahistoria/views/details/details_screen.dart';

class FactsWidget extends StatelessWidget {
  final TileFacts tileFacts;
  final int index;
  const FactsWidget(this.tileFacts, this.index);

  @override
  Widget build(BuildContext context) {
    Color setColor(String color) {
      if (color == null) {
        return Colors.transparent;
      } else if (color == 'Transparente') {
        return Colors.transparent;
      } else if (color == 'Marron') {
        return Colors.brown;
      } else if (color == 'Amarelo') {
        return Colors.yellow;
      } else if (color == 'Azul') {
        return Colors.lightBlue;
      } else {
        return Colors.transparent;
      }
    }

    Color setColorLocal(String local) {
      if (local == 'Brasil') {
        return Colors.green;
      } else if (local == 'América do Norte') {
        return Colors.red;
      } else if (local == 'Europa') {
        return Colors.orange;
      } else if (local == 'América do Sul') {
        return Colors.blue;
      } else if (local == 'Ásia') {
        return Colors.grey[600];
      } else if (local == 'Oceania') {
        return Colors.pinkAccent;
      } else if (local == 'Oriente Médio') {
        return Colors.purple;
      } else {
        return Color.fromARGB(
          tileFacts.myColor.a,
          tileFacts.myColor.r,
          tileFacts.myColor.g,
          tileFacts.myColor.b,
        );
      }
    }

    return GetBuilder<DataController>(
      builder: (dataController) {
        return GestureDetector(
          onTap: () {
            Get.to(DetailsScreen(tileFacts, index));
          },
          onLongPress: () {
            Get.dialog(
              AlertDialog(
                title: const Text('Atenção'),
                content: Text(
                  'Deseja realmente remover o fato: ${tileFacts.fact}?',
                ),
                actions: [
                  FlatButton(
                    color: Colors.blue,
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('Cancelar'),
                  ),
                  FlatButton(
                    color: Colors.red,
                    onPressed: () {
                      dataController.removeFact(index);
                      Get.back();
                    },
                    child: const Text('Ok'),
                  ),
                ],
              ),
            );
          },
          child: Container(
            height: 130,
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: setColorLocal(tileFacts.localDrop),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Row(
                children: [
                  Container(
                    height: 130,
                    width: 130,
                    child: tileFacts.images.isNotEmpty
                        ? Image.file(
                            File(tileFacts.images[0] as String),
                            fit: BoxFit.cover,
                          )
                        : const Icon(
                            Icons.image,
                            size: 70,
                          ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: setColor(tileFacts.color),
                            ),
                            width: MediaQuery.of(context).size.width,
                            height: 5,
                          ),
                          const SizedBox(height: 10),
                          Flexible(
                            child: Text(
                              tileFacts.fact,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.3,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              'Personagem: ${tileFacts.character}',
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                tileFacts.date,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.grey[300]),
                              ),
                              Text(
                                ' ${tileFacts.tyme}',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.grey[300],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '${tileFacts.localDetails}, ',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.grey[300],
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                tileFacts.localDrop,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.grey[300],
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.remove_red_eye,
                    color: Colors.black38,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
