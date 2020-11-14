import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vcnahistoria/controllers/form_controller.dart';

class ListImages extends StatelessWidget {
  final String path;
  final int index;
  final Function(int) remove;

  const ListImages({
    @required this.path,
    @required this.index,
    @required this.remove,
  });

  @override
  Widget build(BuildContext context) {
    final file = File(path);
    return GetBuilder<FormController>(builder: (orderController) {
      return Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: GestureDetector(
          onLongPress: () {
            showDialog(
              context: context,
              child: AlertDialog(
                title: const Text('Tem certeza?'),
                content: const Text('Realmente deseja remover a imagem?'),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancelar'),
                  ),
                  FlatButton(
                    onPressed: () {
                      remove(index);
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Remover',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            );
          },
          child: Image.file(
            file,
            fit: BoxFit.cover,
          ),
        ),
      );
    });
  }
}
