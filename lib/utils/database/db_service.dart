import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({required this.uid});
  final usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future updateUserData(String name, String surname) async {
    return await usersCollection.doc(uid).set(
      {
        'name': name,
        'surname': surname,
      },
    );
  }
}
