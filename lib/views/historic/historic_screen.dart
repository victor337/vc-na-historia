import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vcnahistoria/common/custom_drawer.dart';
import 'package:vcnahistoria/controllers/data_controller.dart';
import 'package:vcnahistoria/views/historic/components/button_filter.dart';
import 'package:vcnahistoria/views/historic/components/facts_widget.dart';
import 'package:vcnahistoria/views/historic/components/info_sheet.dart';


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
          children: [
            const Text(
              'Fatos salvos',
              style: TextStyle(
                color: Colors.white
              ),
            ),
            const SizedBox(width: 10,),
            GestureDetector(
              onTap: () => Get.bottomSheet(InfoSheet()),
              child: Container(
                height: AppBar().preferredSize.height * 0.7,
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  'assets/info.png',
                  fit: BoxFit.contain,
                ),
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
            } else if(dataController.factsFiltered.isNotEmpty){
              dataController.setFactsFilter();
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ButtonFilter(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Seu filtro: ${dataController.filter}',
                        style: const TextStyle(
                          color: Colors.white
                        ),
                      ),
                      FlatButton(
                        onPressed: (){
                          dataController.setFilter('');
                        },
                        child: const Text(
                          'X',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold
                          ),
                        )
                      ),
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    itemCount: dataController.factsFiltered.length,
                    itemBuilder: (ctx, index){
                      return FactsWidget(dataController.factsFiltered[index], index);
                    }
                  ),
                ],
              );
            } else if(dataController.filter != '' && dataController.factsFiltered.isEmpty){
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Seu filtro: ${dataController.filter}',
                        style: const TextStyle(
                          color: Colors.white
                        ),
                      ),
                      FlatButton(
                        onPressed: (){
                          dataController.setFilter('');
                        },
                        child: const Text(
                          'X',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold
                          ),
                        )
                      ),
                    ],
                  ),
                  Center(
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
                            Text('Não encontramos nenhum fato com seu filtro')
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              dataController.setFacts();
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ButtonFilter(),
                  ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    itemCount: dataController.facts.length,
                    itemBuilder: (ctx, index){
                      return FactsWidget(dataController.facts[index], index);
                    }
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}