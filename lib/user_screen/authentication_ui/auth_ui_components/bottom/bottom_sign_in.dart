import 'package:flutter/material.dart';
import '../../sign_up.dart';


class BottomSignIn extends StatelessWidget {
  const BottomSignIn({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("If you're new, try to"),
        TextButton(
          onPressed: () {

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SignUp(),
              ),
            );

          },
          child: const Text('Sign Up'),
        ),
      ],
    );
  }
}










