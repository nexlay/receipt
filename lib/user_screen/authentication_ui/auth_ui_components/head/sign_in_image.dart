import 'package:flutter/material.dart';

class ImageSignIn extends StatelessWidget {
  const ImageSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Image(
        image: AssetImage('assets/graphics/signIn.png'),
        height: 200,
        width: 200,
      ),
    );
  }
}
