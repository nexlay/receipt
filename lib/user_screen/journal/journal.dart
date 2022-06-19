import 'package:flutter/material.dart';

class Journal extends StatelessWidget {
  const Journal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        elevation: 0,
        title: const Text('Journal'),
      ),
      body: const Text('Hello'),
    );
  }
}
