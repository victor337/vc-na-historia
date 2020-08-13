import 'package:brasil_fields/formatter/data_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vcnahistoria/controllers/form_controller.dart';
import 'package:vcnahistoria/views/home/common/custom_form_field.dart';


class FormAll extends StatelessWidget {  

  final FocusNode focusData = FocusNode();
  final FocusNode focusFato = FocusNode();
  final FocusNode focusPerso = FocusNode();
  final FocusNode focusLocal = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15)
      ),
      child: GetBuilder<FormController>(
        init: FormController(),
        builder: (formControll){
          return Column(
            children: [
              CustomFormField(
                hintText: 'XX/XX/XXXX',
                labelText: 'Data',
                focusNode: focusData,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                textInputFormatter: [
                  FilteringTextInputFormatter.digitsOnly,
                  DataInputFormatter()
                ],
                onChanged: formControll.setData,
                onSubmit: (text){
                  focusData.unfocus();
                  FocusScope.of(context).requestFocus(focusFato);
                }
              ),
              CustomFormField(
                hintText: 'Digite aqui',
                labelText: 'Fato histórico',
                focusNode: focusFato,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                textInputFormatter: const [
                ],
                onChanged: formControll.setfato,
                onSubmit: (text){
                  focusData.unfocus();
                  FocusScope.of(context).requestFocus(focusPerso);
                }
              ),
              CustomFormField(
                hintText: 'Digite aqui',
                labelText: 'Personagem',
                focusNode: focusPerso,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                textInputFormatter: const [
                ],
                onChanged: formControll.setperson,
                onSubmit: (text){
                  focusPerso.unfocus();
                  FocusScope.of(context).requestFocus(focusLocal);
                }
              ),
              CustomFormField(
                hintText: 'Digite aqui',
                labelText: 'Local',
                focusNode: focusLocal,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                textInputFormatter: const [
                ],
                onChanged: formControll.setlocal,
                onSubmit: (text){
                  focusLocal.unfocus();
                }
              ),
            ],
          );
        },
      ),
    );
  }
}