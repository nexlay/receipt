import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techka/user_screen/home/start.dart';
import 'package:techka/wrappers/auth_wrapper.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localUser = Provider.of<User?>(context);

    if (localUser == null) {
      return const AuthWrapper();
    } else {
      return const StartPage();
    }
  }
}
