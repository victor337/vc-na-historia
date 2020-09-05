import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vcnahistoria/common/custom_form_field.dart';
import 'package:vcnahistoria/controllers/edit_controller.dart';
import 'package:vcnahistoria/models/tile_facts.dart';


class EditScreen extends StatelessWidget {

  final TileFacts tileFacts;
  EditScreen(this.tileFacts);

  final FocusNode fato = FocusNode();
  final FocusNode character = FocusNode();
  final FocusNode date = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Edição: ${tileFacts.fact}'
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 30, 30, 30),
        child: GetBuilder<EditController>(
          init: EditController(),
          builder: (editController){
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Card(
                  child: ListView(
                    padding: const EdgeInsets.all(8),
                    shrinkWrap: true,
                    children: [
                      CustomFormField(
                        initialValue: tileFacts.fact,
                        hintText: 'Digite aqui',
                        labelText: 'Fato',
                        focusNode: fato,
                        textInputAction:  TextInputAction.next,
                        keyboardType: TextInputType.text,
                        textInputFormatter: null,
                        onChanged: editController.setFact,
                        onSubmit: (fact){
                          fato.unfocus();
                          FocusScope.of(context).requestFocus(character);
                        }
                      ),
                      CustomFormField(
                        initialValue: tileFacts.character,
                        hintText: 'Digite aqui',
                        labelText: 'Personagem',
                        focusNode: character,
                        textInputAction:  TextInputAction.next,
                        keyboardType: TextInputType.text,
                        textInputFormatter: null,
                        onChanged: editController.setcharacter,
                        onSubmit: (fact){
                          character.unfocus();
                          FocusScope.of(context).requestFocus(date);
                        }
                      ),
                      CustomFormField(
                        initialValue: null,
                        hintText: 'Digite aqui',
                        labelText: 'Personagem',
                        focusNode: date,
                        textInputAction:  TextInputAction.next,
                        keyboardType: TextInputType.number,
                        textInputFormatter: null,
                        onChanged: editController.setcharacter,
                        onSubmit: (fact){
                          date.unfocus();
                          FocusScope.of(context).requestFocus();
                        }
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}