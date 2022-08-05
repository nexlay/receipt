import 'package:flutter/material.dart';
import 'package:techka/components/custom_scroll_view.dart';

class Journal extends StatelessWidget {
  const Journal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReceiptCustomScrollView(title: 'Journal', childWidget: SliverList(
        delegate: SliverChildListDelegate(
          [
          ],
        ),
      ),),
    );
  }
}