import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:techka/services/media.dart';
import '../utils/authentication/authentication.dart';
import '../utils/database/storage.dart';

class MyFloatingActionBtn extends StatefulWidget {
  const MyFloatingActionBtn({Key? key}) : super(key: key);

  @override
  State<MyFloatingActionBtn> createState() => _MyFloatingActionBtnState();
}

class _MyFloatingActionBtnState extends State<MyFloatingActionBtn> {
  final MediaService mediaService = MediaService();
  XFile? receiptFile;
  List<String> receiptInfo = [];
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () async {
        receiptFile = await mediaService.getImage(ImageSource.camera, 2);
        receiptInfo = await mediaService.getRecognisedText();
        setState(
              () {
            Storage(uid: Auth().firebaseAuth.currentUser?.uid, imageName: receiptFile?.name).uploadReceipt(receiptFile!.path, receiptInfo[0], receiptInfo[1]);
          },
        );
      },
      tooltip: 'Click to add new sales receipt',
      label: const Text('Add new sales receipt'),
      icon: const Icon(Icons.camera_alt_rounded,),
    );
  }
}
