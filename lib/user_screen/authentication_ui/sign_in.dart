import 'package:flutter/material.dart';
import 'package:techka/components/auth_ui_components/head/sign_in_image.dart';
import 'package:techka/components/auth_ui_components/bottom/bottom.dart';
import 'package:techka/components/auth_ui_components/head/txt_header_sign_up.dart';
import '../../components/auth_ui_components/center/login_field.dart';


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: Center(
            child: SingleChildScrollView(
              child: Wrap(
                runSpacing: 45.0,
                children: const [
                  //Head Image line
                  ImageSignIn(),
                  //Head text line
                  TxtHeaderSignIn(),
                  //Center buttons and fields line
                  MyTextField(),
                  //Bottom Sign Up line
                 MyTxtBtn(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
