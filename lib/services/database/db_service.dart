import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:techka/models/receipt.dart';

import '../../src/features/authentication/domain/entities/local_user_entities.dart';



class DatabaseService {
  final String? uid;
  final String? receiptName;
  DatabaseService({required this.uid, this.receiptName});
  //Db reference
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');



  //Set user data into Db
  Future insertUserData(
      String name, String surname, String imageUrl, int themeValue) async {
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
  Future uploadReceiptDoc(String url, String receiptName, String shop,
      String sum, String receiptDate) async {
    return await usersCollection
        .doc(uid)
        .collection('receipts')
        .doc(receiptName)
        .set({
      'url': url,
      'name': receiptName,
      'shop': shop,
      'sum': sum,
      'date': receiptDate,
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

  //Mapping data from a streams

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
         id: '',
         password: '',
         email: '',
    );
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
            : '',
        date: snapshot.data().toString().contains('date')
            ? snapshot.get('date')
            : '');
  }

  //List of receipts from snapshot
  List<Receipt> _receiptListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Receipt(
          url: doc.data().toString().contains('url') ? doc.get('url') : '',
          name: doc.data().toString().contains('name') ? doc.get('name') : '',
          shop: doc.data().toString().contains('shop') ? doc.get('shop') : '',
          sum: doc.data().toString().contains('sum') ? doc.get('sum') : '',
          date: doc.data().toString().contains('date') ? doc.get('date') : '');
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
    final receiptId = usersCollection.doc().id;
    print('RECEIPT ID IS $receiptId');
    return usersCollection
        .doc(uid)
        .collection('receipts')
        .doc(receiptName)
        .snapshots()
        .map(_receiptFromSnapshot);
  }
}
