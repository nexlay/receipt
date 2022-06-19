import 'package:flutter/material.dart';
import '../../user_screen/authentication_ui/auth_ui_components/head/sign_up_image.dart';
import '../../user_screen/authentication_ui/auth_ui_components/head/txt_header_sign_up.dart';
import 'auth_ui_components/bottom/bottom_sign_up.dart';
import 'auth_ui_components/center/sign_up_field.dart';


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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  //Head Image line
                  ImageSignUp(),
                  SizedBox(height: 45.0,),
                  //Head text line
                  TxtHeaderSignUp(),
                  SizedBox(height: 20.0,),
                  //Center buttons and fields line
                  SignUpTextField(),
                  //Bottom Sign In line
                  SizedBox(height: 45.0,),
                 BottomSignUp(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
