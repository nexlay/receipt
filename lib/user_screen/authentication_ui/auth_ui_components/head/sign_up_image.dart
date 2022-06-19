import 'package:flutter/material.dart';

class ImageSignUp extends StatelessWidget {
  const ImageSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Image(
        image: AssetImage('assets/graphics/signUp.png'),
        height: 200,
        width: 200,
      ),
    );
  }
}
