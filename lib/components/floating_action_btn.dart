import 'package:flutter/material.dart';

class MyFloatingActionBtn extends StatefulWidget {
  const MyFloatingActionBtn({Key? key}) : super(key: key);

  @override
  State<MyFloatingActionBtn> createState() => _MyFloatingActionBtnState();
}

class _MyFloatingActionBtnState extends State<MyFloatingActionBtn> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {},
      tooltip: 'Click to add new sales receipt',
      label: const Text('Add new sales receipt'),
      icon: const Icon(Icons.camera_alt_rounded,),
    );
  }
}
