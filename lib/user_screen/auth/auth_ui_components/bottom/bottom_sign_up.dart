import 'package:flutter/material.dart';


class BottomSignUp extends StatelessWidget {
  const BottomSignUp({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text('Already have an account?'),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Login here'),
              ),
            ],
          );
  }
}
