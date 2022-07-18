import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:techka/models/receipt.dart';
import 'package:techka/models/local_user.dart';

class DatabaseService {
  final String? uid;
  final String? receiptName;
  DatabaseService({required this.uid, this.receiptName});
  //Db reference
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  //Set user data into Db
  Future insertUserData(String name, String surname, String imageUrl, int themeValue) async {
    return await usersCollection.doc(uid).set(
      {
        'name': name,
        'surname': surname,
        'imageUrl': imageUrl,
        'themeValue': themeValue,
      },
    );
  }

  //Add receipt url into Db
  Future uploadReceiptDoc(String url, String receiptName, String shop, String sum) async {
    return await usersCollection
        .doc(uid)
        .collection('receipts')
        .doc(receiptName)
        .set({
      'url': url,
      'name': receiptName,
      'shop': shop,
      'sum': sum,
    });
  }

  //Delete receipt in database when user delete it from Storage
  Future deleteReceiptDocument(String receiptName) async {
    return await usersCollection
        .doc(uid)
        .collection('receipts')
        .doc(receiptName)
        .delete();
  }

  //Update profile image Url in database when user choose profile image
  Future updateProfileImageUrl(String imageUrl) async {
    return await usersCollection.doc(uid).update(
      {
        'imageUrl': imageUrl,
      },
    );
  }
  //Update theme in database when user choose light or dark
  Future updateThemeValue(int themeValue) async {
    return await usersCollection.doc(uid).update(
      {
        'themeValue': themeValue,
      },
    );
  }

  //User from snapshot
  LocalUser _userFromSnapshot(DocumentSnapshot documentSnapshot) {
    return LocalUser(
        name: documentSnapshot.data().toString().contains('name')
            ? documentSnapshot.get('name')
            : '',
        surname: documentSnapshot.data().toString().contains('surname')
            ? documentSnapshot.get('surname')
            : '',
        imageUrl: documentSnapshot.data().toString().contains('imageUrl')
            ? documentSnapshot.get('imageUrl')
            : '',
    themeValue: documentSnapshot.data().toString().contains('themeValue')
        ? documentSnapshot.get('themeValue')
        : 0);
  }

  //Receipt from snapshot
  Receipt _receiptFromSnapshot(DocumentSnapshot snapshot) {
    return Receipt(
        url: snapshot.data().toString().contains('url')
            ? snapshot.get('url')
            : '',
        name: snapshot.data().toString().contains('name')
            ? snapshot.get('name')
            : '',
        shop: snapshot.data().toString().contains('shop')
            ? snapshot.get('shop')
            : '',
        sum: snapshot.data().toString().contains('sum')
            ? snapshot.get('sum')
            : '');
  }

  //List of receipts from snapshot
  List<Receipt> _receiptListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Receipt(
          url: doc.data().toString().contains('url') ? doc.get('url') : '',
          name: doc.data().toString().contains('name') ? doc.get('name') : '',
          shop: doc.data().toString().contains('shop') ? doc.get('shop') : '',
          sum: doc.data().toString().contains('sum') ? doc.get('sum') : '');
    }).toList();
  }

  //Streams

  //Get user stream
  Stream<LocalUser> get userData {
    return usersCollection.doc(uid).snapshots().map(_userFromSnapshot);
  }

  //Get snapshot of receipts stream
  Stream<List<Receipt>> get receipts {
    return usersCollection
        .doc(uid)
        .collection('receipts')
        .snapshots()
        .map(_receiptListFromSnapshot);
  }

//Get receipt stream
  Stream<Receipt> get receipt {
    return usersCollection
        .doc(uid)
        .collection('receipts')
        .doc(receiptName)
        .snapshots()
        .map(_receiptFromSnapshot);
  }
}
