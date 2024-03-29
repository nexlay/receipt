import 'package:image_picker/image_picker.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class MediaService {
  XFile? imageFile;

  Future<XFile?> getImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(
        source: source,
        imageQuality: 85,
      );
      if (pickedImage != null) {
        imageFile = pickedImage;
      }
    } on ImagePicker catch (e) {
      imageFile = null;
      throw Exception(e.toString(),);
    }
    return imageFile;
  }

  Future<List<String>> getRecognisedText() async {
    List<String> words = [];
    List<String> receipt = [];

    final regex = RegExp(r'^[0-9]+\,+[0-9]+$');
    final dateRegex = RegExp(r'^[0-9]+\-+[0-9]+\-+[0-9]+$');

    List<RegExpMatch> match = [];
    List<RegExpMatch> matchDate = [];
    String date = '';

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
            match = regex.allMatches(word.text).toList();
            matchDate = dateRegex.allMatches(word.text).toList();
            for (var matches in match) {
              receipt.add(word.text.substring(matches.start, matches.end));
            }
            for (var dateMatches in matchDate) {
              date = word.text.substring(dateMatches.start, dateMatches.end);
            }
          }
        }
      }
    } catch (e) {
      "Error occurred while scanning";
    }
    return getDataFromText(receipt, words, date);
  }

  List<String> getDataFromText(List<String> data, List<String> words, String date) {
    List<String> receipt = [];
    data.sort();
    for (int i = 0; i < data.length - 1; i++) {
      if (data[i + 1] == data[i]) {
        receipt.add(data[i]);
      }
    }
    if (receipt.length > 1) {
      receipt = [words[0], receipt[1], date];
    } else {
      receipt = [words[0], receipt[0], date];
    }
    return receipt;
  }
}
