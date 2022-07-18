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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        const SizedBox(height: 20.0,),
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
        const SizedBox(height: 20.0,),
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

            ),
            labelText: 'Password',
          ),
        ),


        const SizedBox(height: 20.0,),
        OutlinedButton(
          onPressed: () {
            _auth.signUp(email: email, password: password, name: name, surname: surname, imageUrl: imageUrl, themeValue: themeValue);
          },
          child:
          const Text('Sign Up'),
        ),
      ],
    );
  }
}















