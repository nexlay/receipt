import 'package:flutter/material.dart';

import '../../../utils/authentication/authentication.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({
    Key? key,
  }) : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  final Auth _auth = Auth();
  //Change btn for the Sign In and Sign Up screens
  bool toggle = true;

  bool _setToggle() {
    setState(() {
      toggle = !toggle;
    });
    return toggle;
  }

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 20.0,
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
        Center(
          child: SizedBox(
            width: 100,
            height: 55,
            child: OutlinedButton(
              onPressed: () {
                if(_setToggle()){
                  _auth.signIn(email: email, password: password);
                } else {
                _auth.signUp(email: email, password: password);}
              },
              child:
                  _setToggle() ? const Text('Sign In') : const Text('Sign Up'),
            ),
          ),
        ),
      ],
    );
  }
}
