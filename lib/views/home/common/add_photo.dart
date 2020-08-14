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

      await Permission.camera.request();
      await Permission.storage.request();

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
        addImage(file);
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: ()async{
                            Navigator.of(context).pop();
                            orderController.setLoadingImages();
                            await saveImage(1);
                            orderController.setLoadingImages();
                          },
                          child: Container(
                            height: 50,
                            padding: const EdgeInsets.all(5),
                            child: Image.asset('assets/camera.png'),
                          ),
                        ),
                        const Text('Camera')
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: ()async{
                            Navigator.of(context).pop();
                            orderController.setLoadingImages();
                            await saveImage(2);
                            orderController.setLoadingImages();
                          },
                          child: Container(
                            height: 50,
                            padding: const EdgeInsets.all(5),
                            child: Image.asset('assets/gallery.png'),
                          ),
                        ),
                        const Text(
                          'Galeria'
                        ),
                      ],
                    ),
                  ],
                ),
              )
            );
          },
          child: Container(
            width: 100,
            decoration: BoxDecoration(
              color: const Color.fromARGB(230, 230, 62, 62,),
              borderRadius: BorderRadius.circular(10)
            ),
            child: const Icon(Icons.add, color: Colors.white,),
          ),
        );
      },
    );
  }
}