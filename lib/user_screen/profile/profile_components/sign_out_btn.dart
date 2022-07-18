import 'package:flutter/material.dart';

import '../../../utils/authentication/authentication.dart';

class SignOutBtn extends StatelessWidget {
   SignOutBtn({Key? key}) : super(key: key);

  final Auth _auth = Auth();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: OutlinedButton(
        onPressed: () {
          _auth.signOut();
        },
        child:
        const Text('Sign Out'),
      ),
    );


  }
}
