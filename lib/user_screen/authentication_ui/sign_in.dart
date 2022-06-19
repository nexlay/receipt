import 'package:flutter/material.dart';

import '../../user_screen/authentication_ui/auth_ui_components/center/sign_in_field.dart';
import '../../user_screen/authentication_ui/auth_ui_components/head/sign_in_image.dart';
import '../../user_screen/authentication_ui/auth_ui_components/head/txt_header_sign_in.dart';
import 'auth_ui_components/bottom/bottom_sign_in.dart';




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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  //Head Image line
                  ImageSignIn(),
                  SizedBox(height: 45.0,),
                  //Head text line
                  TxtHeaderSignIn(),
                  SizedBox(height: 20.0,),
                  //Center buttons and fields line
                  SignInTextField(),
                  //Bottom Sign Up line
                  SizedBox(height: 45.0,),
               BottomSignIn(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
