import 'package:flutter/material.dart';

class EmptyHomeScreen extends StatelessWidget {
  const EmptyHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: const [
            Icon(
              Icons.receipt_long,
              size: 150.0,
            ),
            Icon(Icons.add_circle, size: 30.0,),
          ],
        ),
        const SizedBox(
          height: 60.0,
        ),
        const Text(
          'There are no items here!',
        ),
        const SizedBox(
          height: 10.0,
        ),
        const Text(
          'Adding your receipts by tapping the image',
        ),
      ],
    );
  }
}
