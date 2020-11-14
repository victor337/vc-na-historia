import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vcnahistoria/views/historic/components/info_widget.dart';

class InfoSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        onClosing: () {},
        builder: (ctx) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    InfoWidget(title: 'Brasil', color: Colors.green),
                    InfoWidget(title: 'Oceania', color: Colors.pinkAccent),
                    InfoWidget(title: 'Ásia', color: Colors.grey),
                    InfoWidget(title: 'Europa', color: Colors.orange),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    InfoWidget(title: 'Oriente Médio', color: Colors.purple),
                    InfoWidget(title: 'América do Sul', color: Colors.blue),
                    InfoWidget(title: 'América do norte', color: Colors.red),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        'Fechar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
