import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({Key? key}) : super(key: key);

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  final ImagePicker picker = ImagePicker();

  XFile? imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Picker Screen"),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              imageFile == null
                  ? const SizedBox()
                  : Image.file(
                      File(imageFile!.path),
                    ),
              ElevatedButton(
                onPressed: () async {
                  imageFile = await picker.pickImage(
                    source: ImageSource.camera,
                    imageQuality: 100,
                  );
                  setState(() {});
                  debugPrint("imageFile!.path ------------>>> ${imageFile!.path}");
                },
                child: const Text("Select"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
