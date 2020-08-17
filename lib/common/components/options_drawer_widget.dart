import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vcnahistoria/controllers/base_controller.dart';
import 'package:vcnahistoria/models/options_drawer.dart';


class OptionsDrawerWidget extends StatelessWidget {

  final OptionsDrawer optionsDrawer;

  const OptionsDrawerWidget(this.optionsDrawer,);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BaseController>(
      builder: (baseController){
        return GestureDetector(
          onTap: (){
            baseController.setPage(optionsDrawer.index);
          },
          child: Container(
            color: baseController.page == optionsDrawer.index ? 
              const Color.fromARGB(255, 40, 40, 40) : Colors.transparent,
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
            child: Row(
              children: [
                Icon(
                  optionsDrawer.icon,
                  color: baseController.page == optionsDrawer.index ? 
                  Colors.white : Colors.grey),
                const SizedBox(width: 15,),
                Text(
                  optionsDrawer.title,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}