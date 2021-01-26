import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:o_color_picker/o_color_picker.dart';
import 'package:vcnahistoria/common/custom_form_field.dart';
import 'package:vcnahistoria/controllers/data_controller.dart';
import 'package:vcnahistoria/controllers/edit_controller.dart';
import 'package:vcnahistoria/models/tile_facts.dart';
import 'package:vcnahistoria/views/home/common/add_photo.dart';
import 'package:vcnahistoria/views/home/common/dropdown_option.dart';
import 'package:vcnahistoria/views/home/common/list_images.dart';

class EditScreen extends StatelessWidget {
  final TileFacts tileFacts;
  final int index;
  EditScreen(this.tileFacts, this.index);

  final FocusNode _fato = FocusNode();
  final FocusNode _character = FocusNode();
  final FocusNode _date = FocusNode();
  final FocusNode _local = FocusNode();
  final FocusNode _details = FocusNode();

  final controller = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Edição: ${tileFacts.fact}'),
      ),
      body: Container(
        color: const Color.fromARGB(255, 30, 30, 30),
        child: GetBuilder<EditController>(
          init: EditController(),
          builder: (editController) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Card(
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    shrinkWrap: true,
                    children: [
                      CustomFormField(
                          initialValue: tileFacts.fact,
                          hintText: 'Digite aqui',
                          labelText: 'Fato',
                          focusNode: _fato,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          textInputFormatter: null,
                          onChanged: editController.setFact,
                          onSubmit: (fact) {
                            _fato.unfocus();
                            FocusScope.of(context).requestFocus(_character);
                          }),
                      CustomFormField(
                        initialValue: tileFacts.character,
                        hintText: 'Digite aqui',
                        labelText: 'Personagem',
                        focusNode: _character,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        textInputFormatter: null,
                        onChanged: editController.setcharacter,
                        onSubmit: (fact) {
                          _character.unfocus();
                          FocusScope.of(context).requestFocus(_date);
                        },
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomFormField(
                              initialValue: tileFacts.date,
                              hintText: 'XX/XX/XXXX',
                              labelText: 'Data',
                              focusNode: _date,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              textInputFormatter: [
                                FilteringTextInputFormatter.digitsOnly,
                                DataInputFormatter(),
                              ],
                              onChanged: editController.setdate,
                              onSubmit: (text) {
                                _date.unfocus();
                                FocusScope.of(context).requestFocus(_local);
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          DropDownOption(
                            title: 'Época',
                            options: const ['A.C.', 'D.C.'],
                            onChanged: editController.settyme,
                            value: editController.tyme ?? tileFacts.tyme,
                          ),
                        ],
                      ),
                      CustomFormField(
                        initialValue: tileFacts.localDetails,
                        hintText: 'Digite aqui',
                        labelText: 'Local',
                        focusNode: _local,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        textInputFormatter: const [],
                        onChanged: editController.setlocaldetails,
                        onSubmit: (text) {
                          _local.unfocus();
                          FocusScope.of(context).requestFocus(_details);
                        },
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          DropDownOption(
                            title: 'Localização',
                            options: [
                              'Selecione',
                              'Brasil',
                              'América do Norte',
                              'Europa',
                              'América do Sul',
                              'Ásia',
                              'Oriente Médio',
                              'Oceania',
                              'Africa',
                              controller.name,
                            ],
                            onChanged: editController.setlocalDrop,
                            value:
                                editController.localDrop ?? tileFacts.localDrop,
                          ),
                          if (editController.localDrop == controller.name ||
                              tileFacts.localDrop == controller.name)
                            Expanded(
                              child: FlatButton(
                                color: editController.selectedColor ??
                                    tileFacts.myColor.toColor(),
                                textColor: Colors.black,
                                onPressed: () => showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                    content: Material(
                                      child: OColorPicker(
                                        selectedColor:
                                            editController.selectedColor ??
                                                tileFacts.myColor.toColor(),
                                        colors: primaryColorsPalette,
                                        onColorChange: (color) {
                                          editController
                                              .setSelectedColor(color);
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                child: const Text('Alterar sua cor'),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 10),
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
                            onChanged: editController.setcolor,
                            value: editController.colordrop ?? 'Transparente',
                          ),
                        ],
                      ),
                      CustomFormField(
                          maxLines: 5,
                          initialValue: tileFacts.details,
                          hintText: 'Digite aqui',
                          labelText: 'Detalhes',
                          focusNode: _details,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          textInputFormatter: null,
                          onChanged: editController.setdetails,
                          onSubmit: (fact) {
                            _details.unfocus();
                          }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Fotos',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          ),
                          IconButton(
                            icon: const Icon(Icons.info),
                            onPressed: () {
                              Get.dialog(
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 5,
                                  child: AlertDialog(
                                    backgroundColor:
                                        const Color.fromARGB(255, 30, 30, 30),
                                    content: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          'Para apagar uma imagem basta pressionar e confirmar',
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        RaisedButton(
                                          color: Colors.blue,
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: const Text(
                                            'Fechar',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 150,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: editController.images.length + 1,
                            itemBuilder: (ctx, index) {
                              if (index < editController.images.length) {
                                return Row(
                                  children: [
                                    ListImages(
                                      path: editController.images[index],
                                      index: index,
                                      remove: editController.removeImage,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    )
                                  ],
                                );
                              } else {
                                return AddPhoto(
                                  addImage: (path) {
                                    editController.setLoading();
                                    editController.addImageAccount(path);
                                    editController.setLoading();
                                  },
                                );
                              }
                            }),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Visibility(
                        visible: editController.isLoadingImages,
                        child: const LinearProgressIndicator(
                          backgroundColor: Color.fromARGB(255, 30, 30, 30),
                          valueColor: AlwaysStoppedAnimation(Colors.grey),
                        ),
                      ),
                      GetBuilder<DataController>(
                        builder: (dataController) {
                          return RaisedButton(
                            onPressed: editController.localDrop != 'Selecione'
                                ? () {
                                    final TileFacts tileFact = TileFacts(
                                      localDetails:
                                          editController.localdetails ??
                                              tileFacts.localDetails,
                                      date:
                                          editController.date ?? tileFacts.date,
                                      saveData: DateTime.now().toString(),
                                      fact:
                                          editController.fact ?? tileFacts.fact,
                                      character: editController.character ??
                                          tileFacts.character,
                                      images: editController.images ??
                                          tileFacts.images,
                                      color: editController.colordrop ??
                                          tileFacts.color,
                                      details: editController.details ??
                                          tileFacts.details,
                                      myColor:
                                          editController.selectedColor != null
                                              ? ColorMySelect(
                                                  a: editController
                                                      .selectedColor.alpha,
                                                  r: editController
                                                      .selectedColor.red,
                                                  g: editController
                                                      .selectedColor.green,
                                                  b: editController
                                                      .selectedColor.blue,
                                                )
                                              : tileFacts.myColor,
                                      tyme:
                                          editController.tyme ?? tileFacts.tyme,
                                      localDrop: editController.localDrop ??
                                          tileFacts.localDrop,
                                    );
                                    dataController.editFactIndex(
                                      factsTile: index,
                                      newFact: tileFact,
                                    );

                                    Get.back();
                                  }
                                : null,
                            color: const Color.fromARGB(255, 30, 30, 30),
                            child: const Text(
                              'Salvar alterações',
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        },
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
