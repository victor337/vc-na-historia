import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vcnahistoria/common/custom_drawer.dart';
import 'package:vcnahistoria/controllers/data_controller.dart';
import 'package:vcnahistoria/views/historic/components/facts_widget.dart';
import 'package:vcnahistoria/views/historic/components/info_widget.dart';


class HistoricScreen extends StatelessWidget {

  final GlobalKey<ScaffoldState> keySheet = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: const Color.fromARGB(255, 30, 30, 30),
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'Fatos salvos',
              style: TextStyle(
                color: Colors.white
              ),
            ),
            const SizedBox(width: 10,),
            GestureDetector(
              onTap: (){
                Get.bottomSheet(
                  BottomSheet(
                    key: keySheet,
                    onClosing: (){},
                    builder: (ctx){
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                InfoWidget(
                                  title: 'Idade antiga',
                                  color: Colors.orange
                                ),
                                InfoWidget(
                                  title: 'Idade média',
                                  color: Colors.red
                                ),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                InfoWidget(
                                  title: 'Idade moderna',
                                  color: Colors.blue
                                ),
                                InfoWidget(
                                  title: 'Idade contemporânea',
                                  color: Colors.grey
                                ),
                              ],
                            ),
                            const SizedBox(height: 25,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RaisedButton(
                                  color: Theme.of(context).primaryColor,
                                  onPressed: (){
                                    Get.back();
                                  },
                                  child: const Text(
                                    'Fechar',
                                    style: TextStyle(
                                      color: Colors.white
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }
                  ),
                );
              },
              child: Container(
                height: AppBar().preferredSize.height * 0.8,
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  'assets/info.png',
                  fit: BoxFit.contain,
                ),
              ),
            )
          ],
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 30, 30, 30),
        child: GetBuilder<DataController>(
          init: DataController(),
          builder: (dataController){
            if(dataController.facts.isEmpty){
              return Center(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.history,
                          size: 50,
                        ),
                        Text('Ainda não há fatos adicionados')
                      ],
                    ),
                  ),
                ),
              );
            } else {
              dataController.setFacts();
              return ListView.builder(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              itemCount: dataController.facts.length,
              itemBuilder: (ctx, index){
                return FactsWidget(dataController.facts[index], index);
              }
            );
            }
          },
        ),
      ),
    );
  }
}