
import 'package:flutter/material.dart';

import '../../../../utils/authentication/authentication.dart';


class SignUpTextField extends StatefulWidget {
  const SignUpTextField({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpTextField> createState() => _SignUpTextFieldState();
}

class _SignUpTextFieldState extends State<SignUpTextField> {
  final Auth _auth = Auth();


  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          onChanged: (val) {
            setState(() {
              email = val;
            });
          },
          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.email,
              color: Colors.blueAccent,
            ),
            labelText: 'Email',
          ),
        ),
        const SizedBox(height: 20.0,),
        TextFormField(
          onChanged: (val) {
            setState(() {
              password = val;
            });
          },
          obscureText: true,
          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.password,
              color: Colors.blueAccent,
            ),
            labelText: 'Password',
          ),
        ),


        const SizedBox(height: 20.0,),
        OutlinedButton(
          onPressed: () {
            _auth.signUp(email: email, password: password);
          },
          child:
          const Text('Sign Up'),
        ),
      ],
    );
  }
}















