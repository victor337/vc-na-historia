import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vcnahistoria/controllers/data_controller.dart';
import 'package:vcnahistoria/models/tile_facts.dart';
import 'package:vcnahistoria/views/details/components/details_widget.dart';


class DetailsScreen extends StatelessWidget {

  final TileFacts tileFacts;
  final int index;
  const DetailsScreen(this.tileFacts, this.index);

  @override
  Widget build(BuildContext context) {

    String setDate(String date){
      final String year = date.substring(0, 4);
      final String month = date.substring(6, 7);
      final String day = date.substring(8, 10);
      return '$day/$month/$year';
    }

    Color setColor(int nume){
      if(nume >= -4000 && nume <= 475){
        return Colors.orange;
      } else if(nume >= 476 && nume <= 1453){
        return Colors.red;
      } else if(nume >= 1454 && nume <= 1789){
        return Colors.blue;
      } else {
        return Colors.grey;
      }
    }    

    return Scaffold(
      backgroundColor: setColor(int.parse(tileFacts.date)),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Detalhes: ${tileFacts.fact}'
        ),
      ),
      body: Container(
        color: setColor(int.parse(tileFacts.date)),
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: tileFacts.images.isEmpty ?
                const Center(
                  child: Text(
                    'Não há fotos salvas',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ) :
                ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tileFacts.images.length,
                itemBuilder: (ctx, index){
                  return Container(
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
                  );
                }
              ),
            ),
            const SizedBox(height: 10,),
            Card(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        DetailsWidget(
                          title: 'Fato',
                          value: tileFacts.fact
                        ),
                        DetailsWidget(
                          title: 'Personagem',
                          value: tileFacts.character
                        ),
                        DetailsWidget(
                          title: 'Data',
                          value: tileFacts.date,
                          tyme: tileFacts.tyme,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      children: [
                        DetailsWidget(
                          title: 'Detalhes',
                          value: tileFacts.details
                        ),
                      ],
                    ),
                    const SizedBox(height: 15,),
                    Text(
                      'Você salvou este fato em ${setDate(tileFacts.saveData)}',
                      style: const TextStyle(
                        color: Colors.grey
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GetBuilder<DataController>(
              builder: (dataController){
                return Padding(
                  padding: const EdgeInsets.fromLTRB(80, 0, 80, 0),
                  child: RaisedButton(
                    color: Colors.red,
                    onPressed: (){
                      Get.dialog(
                        AlertDialog(
                          title: const Text('Atenção'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('Realmente deseja apagar?'),
                              const SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  RaisedButton(
                                    color: Colors.red,
                                    onPressed: (){
                                      dataController.removeFact(index);
                                      Get.back();
                                      Get.back();
                                    },
                                    child: const Text(
                                      'Sim',
                                      style: TextStyle(
                                        color: Colors.white
                                      ),
                                    ),
                                  ),
                                  RaisedButton(
                                    color: Colors.blue,
                                    onPressed: (){
                                      Get.back();
                                    },
                                    child: const Text(
                                      'Não',
                                      style: TextStyle(
                                        color: Colors.white
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      );                    
                    },
                    child: const Text(
                      'Apagar',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}