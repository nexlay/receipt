import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:techka/services/media.dart';
import '../utils/authentication/authentication.dart';
import '../utils/database/storage.dart';

enum ConfirmAction { Upload, Scan }

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
      onPressed: () {
        showModalBottomSheet(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16.0),
              topLeft: Radius.circular(16.0),
            ),
          ),
          context: context,
          builder: (_) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.20,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton.icon(
                    onPressed: () async {
                      receiptFile =
                          await mediaService.getImage(ImageSource.gallery);
                      receiptInfo = await mediaService.getRecognisedText();
                      if (receiptFile != null) {
                        setState(
                          () {
                            Storage(
                                    uid: Auth().retrieveCurrentUserId(),
                                    imageName: receiptFile?.name)
                                .uploadReceipt(
                                    receiptFile!.path,
                                    receiptInfo[0],
                                    receiptInfo[1],
                                    receiptInfo[2]);
                          },
                        );
                      }
                      Navigator.of(context).pop(ConfirmAction.Upload);
                    },
                    icon: const Icon(
                      Icons.file_upload_outlined,
                    ),
                    label: const Text('Upload'),
                  ),
                  OutlinedButton.icon(
                    onPressed: () async {
                      receiptFile =
                          await mediaService.getImage(ImageSource.camera);
                      receiptInfo = await mediaService.getRecognisedText();
                      if (receiptFile != null) {
                        setState(
                          () {
                            Storage(
                                    uid: Auth().retrieveCurrentUserId(),
                                    imageName: receiptFile?.name)
                                .uploadReceipt(
                              receiptFile!.path,
                              receiptInfo[0],
                              receiptInfo[1],
                              receiptInfo[2],
                            );
                          },
                        );
                      }
                      Navigator.of(context).pop(ConfirmAction.Scan);
                    },
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                    ),
                    label: const Text(' Scan  '),
                  ),
                ],
              ),
            );
          },
        );
      },
      tooltip: 'Click to add new sales receipt',
      label: const Text('New receipt'),
      icon: const Icon(
        Icons.add,
      ),
    );
  }
}
