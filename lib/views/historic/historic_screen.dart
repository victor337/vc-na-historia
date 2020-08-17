import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vcnahistoria/common/custom_drawer.dart';
import 'package:vcnahistoria/controllers/data_controller.dart';
import 'package:vcnahistoria/views/historic/components/facts_widget.dart';


class HistoricScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: const Color.fromARGB(255, 30, 30, 30),
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Text(
              'Fatos salvos',
              style: TextStyle(
                color: Colors.white
              ),
            ),
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