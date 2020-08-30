import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vcnahistoria/controllers/data_controller.dart';
import 'package:vcnahistoria/models/tile_facts.dart';

class ImagesWidget extends StatelessWidget {

  final TileFacts tileFacts;
  final int index;
  final int indexImage;
  const ImagesWidget(this.tileFacts, this.index, this.indexImage);


  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(
      builder: (dataController){
        return GestureDetector(
          onLongPress: (){
            Get.dialog(
              AlertDialog(
                title: const Text('Tem certeza?'),
                content: const Text('Realmente deseja remover a imagem?'),
                actions: <Widget>[
                  FlatButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Cancelar'
                    ),
                  ),
                  FlatButton(
                    onPressed: (){
                      dataController.removeImageFromIndex(index, indexImage);
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Remover',
                      style: TextStyle(
                        color: Colors.red
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width / 2,
            decoration: BoxDecoration(
              border: Border.all(width: 0.5, color: Colors.white)
            ),
            child: FadeInImage(
              fadeInDuration: const Duration(milliseconds: 500),
              placeholder: const AssetImage('assets/transparent.png'),
              image: FileImage(File(tileFacts.images[index] as String)),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}