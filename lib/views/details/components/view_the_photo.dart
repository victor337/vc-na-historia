import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ViewThePhoto extends StatelessWidget {
  final String photo;
  const ViewThePhoto(this.photo);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      body: PhotoView(
        imageProvider: FileImage(File(photo)),
      ),
    );
  }
}
