import 'package:flutter/material.dart';
import 'package:techka/user_screen/authentication_ui/sign_in.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignIn(),
    );
  }
}
