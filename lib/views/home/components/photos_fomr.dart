import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vcnahistoria/controllers/form_controller.dart';
import 'package:vcnahistoria/views/home/common/add_photo.dart';
import 'package:vcnahistoria/views/home/common/list_images.dart';


class PhotosForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.fromLTRB(10, 20, 15, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15)
      ),
      child: GetBuilder<FormController>(
        builder: (formControll){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Fotos',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: formControll.images.length + 1,
                  itemBuilder: (ctx, index){
                    if(index < formControll.images.length){
                      return ListImages(
                        path: formControll.images[index],
                        index: index,
                        remove: formControll.removeImage,
                      );
                    } else {
                      return AddPhoto(
                        addImage: (path){
                          formControll.addImageAccount(path);
                        },
                      );
                    }
                  }
                ),
              ),
              Visibility(
                visible: formControll.isLoadingImages,
                child: const LinearProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation(Colors.grey),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}