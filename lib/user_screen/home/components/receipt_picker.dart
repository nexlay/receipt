import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:techka/components/progress_indicator.dart';
import 'package:techka/utils/authentication/authentication.dart';
import 'package:techka/utils/database/storage.dart';
import '../../../services/media.dart';
import 'empty_home.dart';

class ReceiptPicker extends StatefulWidget {
  const ReceiptPicker({Key? key}) : super(key: key);

  @override
  State<ReceiptPicker> createState() => _GestureState();
}

class _GestureState extends State<ReceiptPicker> {

  final MediaService mediaService = MediaService();
  XFile? receiptFile;
  List<String> receiptInfo = [];

  @override
  Widget build(BuildContext context) {
    return receiptFile != null
        ? const TechkaProgressIndicator()
        : InkWell(
      onTap: () async{
        receiptFile = await mediaService.getImage(ImageSource.camera, 2);
        receiptInfo = await mediaService.getRecognisedText();
        setState(
              () {
          Storage(uid: Auth().firebaseAuth.currentUser?.uid, imageName: receiptFile?.name)
              .uploadReceipt(receiptFile!.path, receiptInfo[0], receiptInfo[1],
          );
          },
        );
      },
      child: const EmptyHomeScreen(),
    );
  }
}








