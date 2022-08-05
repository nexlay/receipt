import 'package:flutter/material.dart';

class ReceiptProgressIndicator extends StatelessWidget {
  const ReceiptProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(),);
  }
}
