import 'package:firebase_auth/firebase_auth.dart';

import '../database/db_service.dart';



class Auth {
  //An instance of FirebaseAuth
  final firebaseAuth = FirebaseAuth.instance;


  String? retrieveEmail () {
    return firebaseAuth.currentUser?.email;
  }

 //stream listening the changes of User's auth
  Stream<User?> get user{
    return firebaseAuth.authStateChanges();
  }

  // SignUp Method:
  // We send the email and password to the createUserWithEmailAndPassword() function.
  // Throwing various Exceptions to handle errors.
  Future signUp({required String email, required String password, required String name, required String surname, required String imageUrl}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      await DatabaseService(uid: Auth().firebaseAuth.currentUser?.uid).insertUserData(name, surname, imageUrl);


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
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);


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
      await firebaseAuth.signOut();
    } catch (e) {
      throw Exception(e);
    }
  }
}
