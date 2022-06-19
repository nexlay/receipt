import 'package:image_picker/image_picker.dart';

class ImgPicker {
  //String scannedText = "";

  //bool _textScanning = false;

  XFile? imageFile;

  void getImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
       // textScanning = true;
        imageFile = pickedImage;
      }
    } catch (e) {
      //_textScanning = false;
      imageFile = null;
     // scannedText = "Error occurred while scanning";
    }
  }
}
