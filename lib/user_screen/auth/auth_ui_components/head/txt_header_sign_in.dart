import 'package:flutter/material.dart';

class TxtHeaderSignIn extends StatelessWidget {
  const TxtHeaderSignIn({Key? key, }) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text ('Welcome back!', style: TextStyle(fontSize: 22.0, ),),
          Text ('Log in to your existent account.',),
        ],
      );
  }
}