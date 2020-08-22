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

    Color setColorLocal(String local){
      if(local == 'Brasil'){
        return Colors.green;
      } else if(local == 'América do Norte'){
        return Colors.red;
      } else if(local == 'Europa'){
        return Colors.orange;
      }  else if(local == 'América do Sul'){
        return Colors.blue;
      } else if(local == 'Ásia'){
        return Colors.grey[600];
      } else {
        return Colors.yellow[800];
      }
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: setColorLocal(tileFacts.localDrop)
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
                color: Colors.white
              ),
            ),
            subtitle: Row(
              children: [
                Text(
                  tileFacts.date.replaceAll('-', ''),
                  style: TextStyle(
                    color: Colors.grey[300]
                  ),
                ),
                Text(
                  tileFacts.tyme??'',
                  style: TextStyle(
                    color: Colors.grey[300],
                  ),
                ),
                const SizedBox(width: 5,),
                Text(
                  tileFacts.localDrop??'',
                  style: TextStyle(
                    color: Colors.grey[300],
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