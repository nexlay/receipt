import 'package:flutter/material.dart';

class TxtHeaderSignUp extends StatelessWidget {
  const TxtHeaderSignUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Let's get started!",
           style: TextStyle(fontSize: 22.0, ),
        ),
        Text('Create an account.',),
      ],
    );
  }
}
