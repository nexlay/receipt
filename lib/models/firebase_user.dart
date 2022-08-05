import '../utils/authentication/authentication.dart';

class FromFirebaseUser {
  final String? uid;

  FromFirebaseUser({required this.uid});

  factory FromFirebaseUser.initialData() {
    return FromFirebaseUser(uid: Auth().retrieveCurrentUserId());
  }
}