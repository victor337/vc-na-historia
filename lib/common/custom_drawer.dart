import 'package:flutter/material.dart';
import 'package:vcnahistoria/common/components/options_drawer_widget.dart';
import 'package:vcnahistoria/models/options_drawer.dart';


class CustomDrawer extends StatelessWidget {

  final OptionsDrawer optionsDrawer1 = OptionsDrawer(
    icon: Icons.history, title: 'Histórico', index: 0
  );

  final OptionsDrawer optionsDrawer2 = OptionsDrawer(
    icon: Icons.add, title: 'Adicionar', index: 1
  );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color.fromARGB(255, 20, 20, 20),
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              color: Colors.white,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Você na história',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18
                    ),
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