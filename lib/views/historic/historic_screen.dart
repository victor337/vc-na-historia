import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vcnahistoria/controllers/form_controller.dart';
import 'package:vcnahistoria/views/historic/components/facts_widget.dart';


class HistoricScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey,
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
      body: GetBuilder<FormController>(
        builder: (formControll){
          return ListView.builder(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
            itemCount: formControll.facts.length,
            itemBuilder: (ctx, index){
              return FactsWidget(formControll.facts[index], index);
            }
          );
        },
      ),
    );
  }
}