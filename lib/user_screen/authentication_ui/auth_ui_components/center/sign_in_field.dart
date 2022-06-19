import 'package:flutter/material.dart';
import '../../../../utils/authentication/authentication.dart';


class SignInTextField extends StatefulWidget {
  const SignInTextField({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInTextField> createState() => _SignInTextFieldState();
}

class _SignInTextFieldState extends State<SignInTextField> {
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
            labelText: 'Login',
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
              _auth.signIn(email: email, password: password);
          },
          child:
               const Text('Sign In') ,
        ),
      ],
    );
  }
}
