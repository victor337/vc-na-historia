import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vcnahistoria/controllers/form_controller.dart';

class Preview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Preview',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        const SizedBox(height: 10,),
        GetBuilder<FormController>(
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
                    const SizedBox(width: 5,),
                    Text(
                      formControll.local??'Local',
                      style: TextStyle(
                        color: formControll.local.toLowerCase() == 'brasil' ? Colors.green : Colors.black
                      ),
                    ),
                  ],
                ),
                trailing: const Icon(Icons.arrow_right),
              ),
            );
          },
        ),
      ],
    );
  }
}