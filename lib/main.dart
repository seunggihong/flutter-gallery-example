import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  File? _image;
  final picker = ImagePicker();

  Future getIamge() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        log("Not Picked Images");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("gallery example"),
          backgroundColor: Colors.blue,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: getIamge,
          backgroundColor: Colors.blue,
          child: const Icon(
            Icons.image,
            color: Colors.white,
          ),
        ),
        body: Center(
          child: _image == null
              ? const Text("No Image Selected")
              : Image.file(_image!),
        ),
      ),
    );
    ;
  }
}
