import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
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

  final FocusNode fato = FocusNode();
  final FocusNode character = FocusNode();
  final FocusNode date = FocusNode();
  final FocusNode local = FocusNode();
  final FocusNode details = FocusNode();

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
                    padding: const EdgeInsets.all(16),
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
                      Row(
                        children: [
                          Expanded(
                            child: CustomFormField(
                              maxLenght: 4,
                              initialValue: tileFacts.date,
                              hintText: 'XXXX',
                              labelText: 'Ano',
                              focusNode: date,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              textInputFormatter: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              onChanged: editController.setdate,
                              onSubmit: (text){
                                date.unfocus();
                                FocusScope.of(context).requestFocus(details);
                              }
                            ),
                          ),
                          const SizedBox(width: 10,),
                          DropDownOption(
                            options: const ['A.C.', 'D.C.'],
                            onChanged: editController.settyme,
                            value: editController.tyme??tileFacts.tyme,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'Local'
                              )
                            ),
                            DropDownOption(
                              options: const ['Selecione','Brasil', 'América do Norte', 'Europa',
                                'América do Sul', 'Ásia', 'Africa'],
                              onChanged: editController.setlocal,
                              value: editController.local??tileFacts.localDrop,
                            ),
                          ],
                        ),
                      ),
                      CustomFormField(
                        maxLines: 5,
                        initialValue: tileFacts.details,
                        hintText: 'Digite aqui',
                        labelText: 'Detalhes',
                        focusNode: details,
                        textInputAction:  TextInputAction.done,
                        keyboardType: TextInputType.text,
                        textInputFormatter: null,
                        onChanged: editController.setdetails,
                        onSubmit: (fact){
                          details.unfocus();
                        }
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Fotos',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.info),
                            onPressed: (){
                              Get.dialog(
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 5,
                                  child: AlertDialog(
                                    backgroundColor: const Color.fromARGB(255, 30, 30, 30),
                                    content: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          // ignore: leading_newlines_in_multiline_strings
                                          'Aqui você apenas adiciona novas imagens. Se quiser excluir alguma: volte para '
                                          'a tela anterior e mantenha pressionada a que deseja apagar.',
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            color: Colors.white
                                          ),
                                        ),
                                        const SizedBox(height: 10,),
                                        RaisedButton(
                                          color: Colors.blue,
                                          onPressed: (){
                                            Get.back();
                                          },
                                          child: const Text(
                                            'Fechar',
                                            style: TextStyle(
                                              color: Colors.white
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              );
                            }
                          )
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        height: 200,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: editController.images.length + 1,
                          itemBuilder: (ctx, index){
                            if(index < editController.images.length){
                              return ListImages(
                                path: editController.images[index],
                                index: index,
                                remove: editController.removeImage,
                              );
                            } else {
                              return AddPhoto(
                                addImage: (path){
                                  editController.setLoading();
                                  editController.addImageAccount(path);
                                  editController.setLoading();
                                },
                              );
                            }
                          }
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Visibility(
                        visible: editController.isLoadingImages,
                        child: const LinearProgressIndicator(
                          backgroundColor: Color.fromARGB(255, 30, 30, 30),
                          valueColor: AlwaysStoppedAnimation(Colors.grey),
                        ),
                      ),
                      GetBuilder<DataController>(
                        builder: (dataController){
                          return RaisedButton(
                            onPressed: (){

                              final TileFacts tileFact = TileFacts(
                                date: editController.date??tileFacts.date,
                                saveData: DateTime.now().toString(),
                                fact: editController.fact??tileFacts.fact,
                                character: editController.character??tileFacts.character,
                                images: editController.images??tileFacts.images,
                                details: editController.details??tileFacts.details,
                                tyme: editController.tyme??tileFacts.tyme,
                                localDrop: editController.local??tileFacts.localDrop
                              );

                              dataController.editFactIndex(
                                factsTile: index,
                                newFact: tileFact
                              );

                              Get.back();
                            },
                            color: const Color.fromARGB(255, 30, 30, 30),
                            child: const Text(
                              'Salvar alterações',
                              style: TextStyle(
                                color: Colors.white
                              ),
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