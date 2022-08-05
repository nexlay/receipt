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
  String name = '';
  String surname = '';
  String imageUrl = '';
  int themeValue = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
     runSpacing: 20.0,
      children: [
        TextFormField(
          onChanged: (val) {
            setState(() {
              name = val;
            });
          },
          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.drive_file_rename_outline_sharp,

            ),
            labelText: 'Name',
          ),
        ),
        TextFormField(
          onChanged: (val) {
            setState(() {
              surname = val;
            });
          },
          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.account_circle,
            ),
            labelText: 'Surname',
          ),
        ),
        TextFormField(
          onChanged: (val) {
            setState(() {
              email = val;
            });
          },
          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.email,

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
            ),
            labelText: 'Password',
          ),
        ),
        ListTile(
          trailing: OutlinedButton(
            onPressed: () {
              _auth.signUp(email: email, password: password, name: name, surname: surname, imageUrl: imageUrl, themeValue: themeValue);
            },
            child:
            const Text('Sign Up'),
          ),
        ),
      ],
    );
  }
}















