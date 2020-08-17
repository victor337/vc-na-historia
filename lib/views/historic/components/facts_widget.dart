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
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: GetBuilder<DataController>(
        builder: (dataController){
          return ListTile(
            onLongPress: (){
              Get.dialog(
                AlertDialog(
                  title: const Text('Atenção'),
                  content: Text('Deseja realmente remover o fato: ${tileFacts.fact}?'),
                  actions: [
                    FlatButton(
                      color: Colors.blue,
                      onPressed: (){
                        Get.back();
                      },
                      child: const Text('Cancelar')
                    ),
                    FlatButton(
                      color: Colors.red,
                      onPressed: (){
                        dataController.removeFact(index);
                        Get.back();
                      },
                      child: const Text('Ok')
                    ),
                  ],
                )
              );
            },
            onTap: (){
              Get.to(DetailsScreen(tileFacts, index));
            },
            title: Text(
              tileFacts.fact,
              style: const TextStyle(
                color: Colors.black
              ),
            ),
            subtitle: Row(
              children: [
                Text(
                  tileFacts.date.replaceAll('-', ''),
                  style: const TextStyle(
                    color: Colors.grey
                  ),
                ),
                Text(
                  tileFacts.tyme,
                  style: TextStyle(
                    color: tileFacts.tyme == 'A.C.' ? Colors.orange : Colors.blue,
                  ),
                ),
                const SizedBox(width: 10,),
                Text(
                  tileFacts.local,
                  style: TextStyle(
                    color: tileFacts.local == 'Brasil' ? Colors.green : Colors.purple,
                  ),
                ),
              ],
            ),
            trailing: const Icon(Icons.arrow_right),
          );
        },
      ),
    );
  }
}