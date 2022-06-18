import 'package:flutter/material.dart';
import 'package:techka/components/auth_ui_components/head/txt_header_sign_in.dart';
import 'package:techka/components/auth_ui_components/head/sign_up_image.dart';
import '../../components/auth_ui_components/center/login_field.dart';
import '../../components/auth_ui_components/bottom/bottom.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                  ImageSignUp(),
                  //Head text line
                  TxtHeaderSignUp(),
                  //Center buttons and fields line
                  MyTextField(),
                  //Bottom Sign In line
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
