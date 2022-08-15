import 'package:flutter/material.dart';
import 'auth_ui_components/bottom/bottom_sign_up.dart';
import 'auth_ui_components/center/sign_up_field.dart';
import 'auth_ui_components/head/brand_image.dart';
import 'auth_ui_components/head/txt_header_sign_up.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.20,
        automaticallyImplyLeading: false,
        title: //Head Image line
        const BrandImage(),
        //centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Center(
            child: SingleChildScrollView(
              child: Wrap(
                runSpacing: 20.0,
                children: const [
                  //Head text line
                  TxtHeaderSignUp(),
                  //Center buttons and fields line
                  SignUpTextField(),
                  //Bottom Sign In line
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
