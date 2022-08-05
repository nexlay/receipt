import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techka/models/firebase_user.dart';
import 'package:techka/wrappers/nav_bar.dart';
import '../user_screen/auth/sign_in.dart';



class Wrapper extends StatelessWidget {
  const Wrapper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FromFirebaseUser>(context);
    if (user.uid == null) {
      return const SignIn();
    } else {
      return const StartPage();
    }
  }
}
