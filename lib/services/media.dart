import 'package:image_picker/image_picker.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class MediaService {
  XFile? imageFile;
  List<String> receiptInfo = [];
  List<String> result = [];


  Future<XFile?> getImage(ImageSource source, int quality) async {
    try {
      if (quality == 1) {
        final pickedImage = await ImagePicker().pickImage(
          source: source,
          imageQuality: 65,
          maxHeight: 480,
          maxWidth: 640,
        );
        if (pickedImage != null) {
          imageFile = pickedImage;
        }
      } else {
        final pickedImage = await ImagePicker().pickImage(
          source: source,
          imageQuality: 75,
          maxHeight: 1920,
          maxWidth: 1080,
        );
        if (pickedImage != null) {
          imageFile = pickedImage;
        }
      }
    } catch (e) {
      imageFile = null;
    }
    return imageFile;
  }

  Future<List<String>> getRecognisedText() async {
    List<String> words = [];
    try {
      final inputImage = InputImage.fromFilePath(imageFile!.path);
      final textDetector = GoogleMlKit.vision.textRecognizer();
      final RecognizedText recognisedText =
          await textDetector.processImage(inputImage);
      await textDetector.close();
      for (TextBlock block in recognisedText.blocks) {
        for (TextLine lines in block.lines) {
          for (TextElement word in lines.elements) {
            words.add(word.text);
            final regex = RegExp(r'^[0-9]+\,+[0-9]+$');
            List<RegExpMatch> match = regex.allMatches(word.text).toList();
            for (var matches in match) {
              result.add(
                word.text.substring(matches.start, matches.end),
              );
            }
          }
        }
      }
      for (int i = 0; i < result.length - 1; i++) {
        if (result[i + 1] == result[i]) {
          receiptInfo.add(result[i]);
        }
      }
      for (int i = 0; i < receiptInfo.length - 1; i++) {
        if (result[i + 1] == result[i]) {
          receiptInfo.add(result[i]);
        }
      }
      if(receiptInfo.length == 1){
        receiptInfo = [words[0], receiptInfo[0]];
      } else {
        receiptInfo[0] = words[0];
      }

    } catch (e) {
      "Error occurred while scanning";
    }
    return receiptInfo.toSet().toList();
  }
}
