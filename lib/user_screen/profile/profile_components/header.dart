import 'package:flutter/material.dart';

import '../../../utils/authentication/authentication.dart';

class Account extends StatelessWidget {
  Account({Key? key}) : super(key: key);

  final Auth _auth = Auth();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Hello User!'),
      isThreeLine: true,
      subtitle: Text(
        _auth.retrieveEmail()!,
      ),
      trailing: const CircleAvatar(
        backgroundImage: AssetImage('assets/graphics/avatar.png'),
      ),
    );
  }
}
