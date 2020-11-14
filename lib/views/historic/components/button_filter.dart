import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vcnahistoria/controllers/data_controller.dart';

class ButtonFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(
      builder: (dataController) {
        return FlatButton(
          onPressed: () {
            Get.bottomSheet(
              BottomSheet(
                  onClosing: () {},
                  builder: (_) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Digite ao menos 3 caracteres sobre algo do fato para pesquisar',
                            textAlign: TextAlign.center,
                          ),
                          TextFormField(
                            initialValue: dataController.filter,
                            onChanged: dataController.setFilter,
                            onFieldSubmitted: (a) {
                              FocusScope.of(context).unfocus();
                              Get.back();
                            },
                          ),
                        ],
                      ),
                    );
                  }),
            );
          },
          child: const Text(
            'Filtrar',
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }
}
