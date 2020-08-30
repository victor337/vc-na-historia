import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vcnahistoria/common/components/options_drawer_widget.dart';
import 'package:vcnahistoria/controllers/data_controller.dart';
import 'package:vcnahistoria/models/options_drawer.dart';


class CustomDrawer extends StatelessWidget {

  final OptionsDrawer optionsDrawer1 = OptionsDrawer(
    icon: Icons.history, title: 'Histórico', index: 0
  );

  final OptionsDrawer optionsDrawer2 = OptionsDrawer(
    icon: Icons.add, title: 'Adicionar', index: 1
  );

  final TextEditingController name = TextEditingController();
  final DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color.fromARGB(255, 20, 20, 20),
        child: ListView(
          shrinkWrap: true,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.grey,
                  ),
                  onPressed: (){
                    Get.bottomSheet(
                      BottomSheet(
                        onClosing: (){},
                        builder: (_){
                          return Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text('Digite seu nome para deixar sua experiência mais personalizada'),
                                const SizedBox(height: 10,),
                                TextFormField(
                                  controller: name,
                                  style: const TextStyle(
                                    color: Colors.black
                                  ),
                                  decoration: const InputDecoration(
                                    hintText: 'Digite aqui'
                                  ),
                                ),
                                RaisedButton(
                                  color: const Color.fromARGB(255, 30, 30, 30),
                                  onPressed: name.text != null ? (){
                                    dataController.setName(name.text);
                                    Get.back();
                                  }: null,
                                  child: const Text(
                                    'Salvar',
                                    style: TextStyle(
                                      color: Colors.white
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      ),
                    );
                  }
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              color: Colors.white,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GetBuilder<DataController>(
                    builder: (dataController){
                      return Text(
                        '${dataController.name} na história',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18
                        ),
                      );
                    },
                  ),
                  Expanded(
                    child: Image.asset(
                      'assets/history.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
            OptionsDrawerWidget(optionsDrawer1),
            OptionsDrawerWidget(optionsDrawer2),
          ],
        ),
      ),
    );
  }
}