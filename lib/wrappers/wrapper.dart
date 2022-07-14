import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techka/wrappers/nav_bar.dart';
import '../user_screen/authentication_ui/sign_in.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);

    if (user == null) {
      return const SignIn();
    } else {
      return const StartPage();
    }
  }
}
