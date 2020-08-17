import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vcnahistoria/controllers/form_controller.dart';
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

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 30, 30),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Detalhes: ${tileFacts.fact}'
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 30, 30, 30),
        child: ListView(
          padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
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
                      image: FileImage(tileFacts.images[index],)
                    ),
                  );
                }
              )
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
                          title: 'Data',
                          value: tileFacts.date
                        ),
                      ],
                    ),
                    const SizedBox(height: 40,),
                    Row(
                      children: [
                        DetailsWidget(
                          title: 'Personagem',
                          value: tileFacts.character
                        ),
                        DetailsWidget(
                          title: 'Local',
                          value: tileFacts.local
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
            GetBuilder<FormController>(
              builder: (formController){
                return RaisedButton(
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
                                    formController.removeFact(index);
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
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}