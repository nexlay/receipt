import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class ReceiptPicker extends StatefulWidget {
  const ReceiptPicker({Key? key}) : super(key: key);

  @override
  State<ReceiptPicker> createState() => _ReceiptPickerState();
}

class _ReceiptPickerState extends State<ReceiptPicker> {
  String scannedText = "";

  bool textScanning = false;

  XFile? imageFile;

  void _getImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        setState(() {
          textScanning = true;
          imageFile = pickedImage;
        });
      }
    } catch (e) {
      textScanning = false;
      imageFile = null;
      scannedText = "Error occurred while scanning";
    }
  }

  @override
  Widget build(BuildContext context) {
    return imageFile != null
        ? Image.file(
            File(imageFile!.path),
          )
        : GestureDetector(
            onTap: () {
              _getImage(ImageSource.gallery);
            },
            child: const Center(
              child: Image(
                image: AssetImage('assets/graphics/home_page.png'),
                height: 200,
                width: 200,
              ),
            ),
          );
  }
}
