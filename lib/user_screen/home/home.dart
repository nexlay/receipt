import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../services/receipt_source_picker.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

final ImgPicker imgPicker = ImgPicker();


class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        elevation: 0,
        title: const Text('Home'),
      ),
      body: imgPicker.imageFile != null
          ? Image.file(
              File(imgPicker.imageFile!.path),
            )
          : GestureDetector(
              onTap: () {
                setState(
                  () {
                    imgPicker.getImage(ImageSource.gallery);

                  },
                );
              },
              child: const Center(
                child: Image(
                  image: AssetImage('assets/graphics/home_page.png'),
                  height: 200,
                  width: 200,
                ),
              ),
            ),
    );
  }
}
