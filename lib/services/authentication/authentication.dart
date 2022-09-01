import 'package:firebase_auth/firebase_auth.dart';
import 'package:techka/models/firebase_user.dart';
import '../database/db_service.dart';

class Auth {
  //An instance of FirebaseAuth
  final _firebaseAuth = FirebaseAuth.instance;

  //Create local FromFirebaseUser with id
  FromFirebaseUser _userFromFirebase(User? user) {
    return FromFirebaseUser(uid: user?.uid);
  }

  //Stream listening the changes of User's auth
  Stream<FromFirebaseUser> get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }
  //Retrieve user email
  String? retrieveEmail() {
    return _firebaseAuth.currentUser?.email;
  }
   //Retrieve user id
  String? retrieveCurrentUserId() {
    return _firebaseAuth.currentUser?.uid;
  }

  // SignUp Method:
  // We send the email and password to the createUserWithEmailAndPassword() function.
  // Throwing various Exceptions to handle errors.
  Future signUp(
      {required String email,
      required String password,
      required String name,
      required String surname,
      required String imageUrl,
      required int themeValue}) async {
    try {
      UserCredential credential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      User? user = credential.user;

      await DatabaseService(uid: user?.uid)
          .insertUserData(name, surname, imageUrl, themeValue);

      return _userFromFirebase(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'week password') {
        throw Exception('The password is too week.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //SignIn Method
  Future signIn({required String email, required String password}) async {
    try {
      UserCredential credential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      User? user = credential.user;

      return _userFromFirebase(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      }
    }
  }

  //SignOut
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception(e);
    }
  }
}
