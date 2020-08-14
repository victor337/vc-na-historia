import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vcnahistoria/controllers/form_controller.dart';

class Preview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FormController>(
      builder: (formControll){
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: ListTile(
            title: Text(
              formControll.fato??'Fato',
            ),
            subtitle: Row(
              children: [
                Text(
                  formControll.data??'Data,'
                ),
                const SizedBox(width: 20,),
                Text(
                  formControll.local??'Local',
                  style: const TextStyle(
                    color: Colors.green
                  ),
                ),
              ],
            ),
            trailing: const Icon(Icons.arrow_right),
          ),
        );
      },
    );
  }
}