import 'package:firebase_auth/firebase_auth.dart';
import '../../models/user.dart';


class Auth {
  //An instance of FirebaseAuth
  final _firebaseAuth = FirebaseAuth.instance;

/*  //Create local User from FirebaseUser and take necessary parameters
  LocalUser _localUserFromFirebaseUser (User user){
    return LocalUser(uid: user.uid);
  }*/

 //stream listening the changes of User's auth
  Stream<User?> get user{
    return _firebaseAuth.authStateChanges();
  }

  // SignUp Method:
  // We send the email and password to the createUserWithEmailAndPassword() function.
  // Throwing various Exceptions to handle errors.
  Future<void> signUp({required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
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
  Future<void> signIn({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
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
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception(e);
    }
  }
}
