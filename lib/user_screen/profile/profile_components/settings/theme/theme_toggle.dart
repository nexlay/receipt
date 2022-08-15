import 'package:flutter/material.dart';
import 'package:techka/components/custom_scroll_view.dart';
import 'theme_action_chips.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReceiptCustomScrollView(
        title: 'Theme',
        childWidget: SliverFillRemaining(
          child: ThemeAction(),
        ),
      ),
    );
  }
}
