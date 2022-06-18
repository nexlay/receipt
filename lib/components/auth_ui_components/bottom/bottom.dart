import 'package:flutter/material.dart';
import 'package:techka/user_screen/authentication_ui/sign_up.dart';

class MyTxtBtn extends StatefulWidget {
  const MyTxtBtn({
    Key? key,
  }) : super(key: key);

  @override
  State<MyTxtBtn> createState() => _MyTxtBtnState();
}

class _MyTxtBtnState extends State<MyTxtBtn> {
  //Change btn for the Sign In and Sign Up screens
  bool toggle = true;

  bool _setToggle() {
    setState(() {
      toggle = !toggle;
    });
    return toggle;
  }

  @override
  Widget build(BuildContext context) {
    return _setToggle()
        ? Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("If you're new, try to"),
              TextButton(
                onPressed: () {
                  _setToggle();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SignUp(),
                    ),
                  );

                },
                child: const Text('Sign Up'),
              ),
            ],
          )
        : Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already have an account?'),
              TextButton(
                onPressed: () {
                  _setToggle();
                  Navigator.of(context).pop();


                },
                child: const Text('Login here'),
              ),
            ],
          );
  }
}
