import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vcnahistoria/controllers/form_controller.dart';
import 'package:vcnahistoria/common/custom_form_field.dart';
import 'package:vcnahistoria/views/home/common/dropdown_option.dart';

class FormAll extends StatefulWidget {
  @override
  _FormAllState createState() => _FormAllState();
}

class _FormAllState extends State<FormAll> {
  final FocusNode _focusData = FocusNode();
  final FocusNode _focusFato = FocusNode();
  final FocusNode _focusPerso = FocusNode();
  final FocusNode _focusLocal = FocusNode();
  final FocusNode _focusDetails = FocusNode();

  final List<String> options = ['Selecione', 'A.C.', 'D.C.'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: GetBuilder<FormController>(
        builder: (formControll) {
          return Column(
            children: [
              const Text(
                'Dados',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomFormField(
                      initialValue: '',
                      hintText: 'XX/XX/XXXX',
                      labelText: 'Data',
                      focusNode: _focusData,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      textInputFormatter: [
                        FilteringTextInputFormatter.digitsOnly,
                        DataInputFormatter(),
                      ],
                      onChanged: formControll.setData,
                      onSubmit: (text) {
                        _focusData.unfocus();
                        FocusScope.of(context).requestFocus(_focusFato);
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  DropDownOption(
                    title: 'Tempo',
                    options: options,
                    onChanged: formControll.setTyme,
                    value: formControll.tyme ?? 'Selecione',
                  ),
                ],
              ),
              CustomFormField(
                initialValue: formControll.fato,
                hintText: 'Digite aqui',
                labelText: 'Fato histórico',
                focusNode: _focusFato,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                textInputFormatter: const [],
                onChanged: formControll.setfato,
                onSubmit: (text) {
                  _focusData.unfocus();
                  FocusScope.of(context).requestFocus(_focusPerso);
                },
              ),
              CustomFormField(
                initialValue: formControll.person,
                hintText: 'Digite aqui',
                labelText: 'Personagem',
                focusNode: _focusPerso,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                textInputFormatter: const [],
                onChanged: formControll.setperson,
                onSubmit: (text) {
                  _focusPerso.unfocus();
                  FocusScope.of(context).requestFocus(_focusLocal);
                },
              ),
              CustomFormField(
                initialValue: formControll.localdetails,
                hintText: 'Digite aqui',
                labelText: 'Local',
                focusNode: _focusLocal,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                textInputFormatter: const [],
                onChanged: formControll.setlocaldetails,
                onSubmit: (text) {
                  _focusLocal.unfocus();
                  FocusScope.of(context).requestFocus(_focusDetails);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DropDownOption(
                          title: 'Localização',
                          options: const [
                            'Selecione',
                            'Brasil',
                            'América do Norte',
                            'Europa',
                            'América do Sul',
                            'Ásia',
                            'Oriente Médio',
                            'Oceania',
                            'Africa'
                          ],
                          onChanged: formControll.setlocalDrop,
                          value: formControll.localDrop ?? 'Selecione',
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DropDownOption(
                          title: 'Cor destaque',
                          options: const [
                            'Transparente',
                            'Marron',
                            'Amarelo',
                            'Azul'
                          ],
                          onChanged: formControll.setcolor,
                          value: formControll.colordrop ?? 'Transparente',
                        ),
                      ],
                    ),
                  ],
                ),
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
                  focusNode: _focusDetails,
                  onFieldSubmitted: (txt) {
                    _focusDetails.unfocus();
                  },
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.done,
                  onChanged: formControll.setdetails,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Escreva aqui os detalhes',
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
