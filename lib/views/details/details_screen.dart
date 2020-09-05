import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vcnahistoria/controllers/data_controller.dart';
import 'package:vcnahistoria/models/tile_facts.dart';
import 'package:vcnahistoria/views/details/components/add_image.dart';
import 'package:vcnahistoria/views/details/components/details_widget.dart';
import 'package:vcnahistoria/views/details/components/images_widegt.dart';
import 'package:vcnahistoria/views/edit/edit_screen.dart';



class DetailsScreen extends StatelessWidget{
  
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

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 30, 30),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Detalhes: ${tileFacts.fact}'
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.edit,
              color: Colors.grey
            ),
            onPressed: (){
              Get.to(EditScreen(tileFacts));
            }
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        color: const Color.fromARGB(255, 30, 30, 30),
        child: GetBuilder<DataController>(
          builder: (dataController){
            return ListView(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: tileFacts.images.isEmpty ?
                    AddImage(
                      addImage: (file){
                        dataController.addImageFromIndex(index, file);
                      },
                    ) :
                    ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: tileFacts.images.length + 1,
                    itemBuilder: (ctx, indexImage){
                      if(indexImage < tileFacts.images.length){
                        return ImagesWidget(tileFacts, index, indexImage);
                      } else{
                        return AddImage(
                          addImage: (file){
                            dataController.addImageFromIndex(index, file);
                          },
                        );
                      }
                    }
                  ),
                ),
                if(dataController.imageLoading)
                  const LinearProgressIndicator(
                    backgroundColor: Colors.transparent,
                    valueColor: AlwaysStoppedAnimation(Colors.grey),
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
                Padding(
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
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}