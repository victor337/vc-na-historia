import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vcnahistoria/controllers/form_controller.dart';


class AddPhoto extends StatelessWidget {

  final Function(File) addImage;
  const AddPhoto({
    @required this.addImage
  });

  @override
  Widget build(BuildContext context) {

    Future<void> saveImage(int font)async{

      if(await Permission.camera.request().isDenied ||
        await Permission.storage.request().isDenied){
          showDialog(
            context: context,
            child: AlertDialog(
              content: const Text(
                'É necessário permissão para tirar/escolher as fotos'
              ),
              actions: <Widget>[
                FlatButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: const Text('Ok'),
                ),
              ],
            )
          );
          return;
      } else {
        final picker = ImagePicker();

        PickedFile pickedFile;

        if(font == 1){
          pickedFile = await picker.getImage(
            source: ImageSource.camera, imageQuality: 40
          );
          await GallerySaver.saveImage(pickedFile.path).then((value){
            if(value){
              Get.snackbar(
                'Salvo',
                'Essa foto foi salva na galeria!',
                backgroundColor: Colors.green,
                colorText: Colors.white
              );
            } else{
              Get.snackbar(
                'Não salvo',
                'Não foi possível salvar essa imagem na galeria',
                backgroundColor: Colors.green,
                colorText: Colors.white
              );
            }
          });
        } else {
          pickedFile = await picker.getImage(
            source: ImageSource.gallery, imageQuality: 40
          );
        }
        
        if(pickedFile == null){
          showDialog(
            context: context,
            child: AlertDialog(
              content: const Text(
                'Nenhuma imagem selecionada'
              ),
              actions: <Widget>[
                FlatButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: const Text('Ok'),
                ),
              ],
            )
          );
          return;
        }
        final File file = File(pickedFile.path);
        final bool sucess = await GallerySaver.saveImage(file.path);
        if(sucess){
          addImage(file);
        } else {
          Get.snackbar(
            'Erro',
            'Não foi possível salvar a imagem',
            backgroundColor: Colors.red
          );
        }
        
      }

    }

    return GetBuilder<FormController>(
      init: FormController(),
      builder: (orderController){
        return GestureDetector(
          onTap: (){
            Get.bottomSheet(
              Container(
                padding: const EdgeInsets.all(10),
                color: Colors.white,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.photo_camera),
                      onPressed: ()async{
                        Navigator.of(context).pop();
                        orderController.setLoadingImages();
                        await saveImage(1);
                        orderController.setLoadingImages();
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.photo_album),
                      onPressed: ()async{
                        Navigator.of(context).pop();
                        orderController.setLoadingImages();
                        await saveImage(2);
                        orderController.setLoadingImages();
                      },
                    ),
                  ],
                ),
              )
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(230, 255, 153, 51,),
              borderRadius: BorderRadius.circular(10)
            ),
            child: const Icon(Icons.add, color: Colors.white,),
          ),
        );
      },
    );
  }
}