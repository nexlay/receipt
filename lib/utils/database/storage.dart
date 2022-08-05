import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:techka/utils/database/db_service.dart';

class Storage {
  final String? uid;
  final String? imageName;

  Storage({required this.uid, required this.imageName});

  //Create an instance of FirebaseStorage
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  //Upload the profile image into FirebaseStorage
  Future<void> uploadProfileImage(String filePath) async {
    File file = File(filePath);
    try {
      await firebaseStorage.ref('profile_image/$uid/$imageName').putFile(file);

      await _getProfileImageUrl(imageName);
    } on FirebaseException catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }

  //Retrieve image url from Storage
  Future<void> _getProfileImageUrl(String? imageName) async {
    String downloadUrl = await firebaseStorage
        .ref('profile_image/$uid/$imageName')
        .getDownloadURL();
    await DatabaseService(uid: uid).updateProfileImageUrl(downloadUrl);
  }

  //Upload the receipt into FirebaseStorage
  Future<void> uploadReceipt(String filePath, String shop, String sum) async {
    File file = File(filePath);
    try {
      await firebaseStorage.ref('receipts/$uid/$imageName').putFile(file);
      await _getReceiptUrl(imageName, shop, sum);

    } on FirebaseException catch (e) {
      throw Exception(e.toString());
    }
  }

//Retrieve receipt url
  Future<void> _getReceiptUrl(String? receiptName, String shop, String sum) async {
    String downloadUrl = await firebaseStorage
        .ref('receipts/$uid/$receiptName')
        .getDownloadURL().timeout(Duration(seconds: 1),);
    await DatabaseService(uid: uid).uploadReceiptDoc(downloadUrl, receiptName!, shop, sum);
  }

  //Delete receipt from Storage
Future<void> deleteReceipt () async {
    await firebaseStorage.ref('receipts/$uid/$imageName').delete();
    await DatabaseService(uid: uid).deleteReceiptDocument(imageName!);
}
}
