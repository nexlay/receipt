import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../user_screen/authentication_ui/sign_in.dart';
import '../user_screen/authentication_ui/sign_up.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);

    if (user != null) {
      return const SignUp();
    } else {
      return const SignIn();
    }
  }
}
