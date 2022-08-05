import 'package:flutter/material.dart';
import 'auth_ui_components/bottom/bottom_sign_in.dart';
import 'auth_ui_components/center/sign_in_field.dart';
import 'auth_ui_components/head/brand_image.dart';
import 'auth_ui_components/head/txt_header_sign_in.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.20,
        title: //Head Image line
        const BrandImage(),
        //centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: SingleChildScrollView(
              child: Wrap(
                runSpacing: 20.0,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  //Head text line
                  TxtHeaderSignIn(),
                  //Center buttons and fields line
                  SignInTextField(),
                  //Bottom Sign Up line
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
