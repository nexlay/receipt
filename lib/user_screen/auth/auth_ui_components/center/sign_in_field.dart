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
            ),
            labelText: 'Login',
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
        TextButton(onPressed: (){}, child: Text('Forgot your password?'),),
        ListTile(
          trailing: OutlinedButton(
            onPressed: () {
              setState(() {
                _auth.signIn(email: email, password: password);
              });
            },
            child:
                 const Text('Sign In'),
          ),
        ),
      ],
    );
  }
}
