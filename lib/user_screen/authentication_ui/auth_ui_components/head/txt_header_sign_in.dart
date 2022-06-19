import 'package:flutter/material.dart';

class TxtHeaderSignIn extends StatelessWidget {
  const TxtHeaderSignIn({Key? key, }) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text ('Welcome back!', style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),),
          Text ('Log in to your existent account.', style: TextStyle(color: Colors.grey),),
        ],
      );
  }
}