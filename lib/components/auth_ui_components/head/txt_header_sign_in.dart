import 'package:flutter/material.dart';

class TxtHeaderSignUp extends StatelessWidget {
  const TxtHeaderSignUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      children: const [
        Text(
          "Let's get started",
          style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
        ),
        Text('Create an account', style: TextStyle(color: Colors.grey),),
      ],
    );
  }
}
