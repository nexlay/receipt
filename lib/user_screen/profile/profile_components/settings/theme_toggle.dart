import 'package:flutter/material.dart';
import 'package:techka/components/custom_scroll_view.dart';
import 'action_chips.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TechkaCustomScrollView(
        title: 'Theme',
        childWidget: SliverFillRemaining(
          child: ThemeAction(),
        ),
      ),
    );
  }
}
