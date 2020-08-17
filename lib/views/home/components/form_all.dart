import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vcnahistoria/controllers/form_controller.dart';
import 'package:vcnahistoria/views/home/common/custom_form_field.dart';
import 'package:vcnahistoria/views/home/common/dropdown_option.dart';


class FormAll extends StatelessWidget {  

  final FocusNode focusData = FocusNode();
  final FocusNode focusFato = FocusNode();
  final FocusNode focusPerso = FocusNode();
  final FocusNode focusLocal = FocusNode();
  final FocusNode focusDetails = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15)
      ),
      child: GetBuilder<FormController>(
        builder: (formControll){
          return Column(
            children: [
              const Text(
                'Dados',
                style: TextStyle(
                  fontSize: 20
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: CustomFormField(
                      maxLenght: 4,
                      initialValue: formControll.data,
                      hintText: 'XXXX',
                      labelText: 'Ano',
                      focusNode: focusData,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      textInputFormatter: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: formControll.setData,
                      onSubmit: (text){
                        focusData.unfocus();
                        FocusScope.of(context).requestFocus(focusFato);
                      }
                    ),
                  ),
                  DropDownOption(
                    title: 'Tempo',
                    options: const ['A.C.', 'D.C.'],
                    onChanged: formControll.setTyme,
                    value: formControll.tyme??'D.C.',
                  ),
                ],
              ),
              CustomFormField(
                initialValue: formControll.fato,
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
                initialValue: formControll.person,
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
                initialValue: formControll.local,
                hintText: 'Digite aqui',
                labelText: 'Local',
                focusNode: focusLocal,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                textInputFormatter: const [
                ],
                onChanged: formControll.setlocal,
                onSubmit: (text){
                  focusLocal.unfocus();
                  FocusScope.of(context).requestFocus(focusDetails);
                }
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                height: 200,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(200, 255, 255, 255),
                  border: Border.all(width: 0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  initialValue: formControll.details,
                  maxLines: 10,
                  focusNode: focusDetails,
                  onFieldSubmitted: (txt){
                    focusDetails.unfocus();
                  },
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.done,
                  onChanged: formControll.setdetails,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Escreva aqui os detalhes'
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}