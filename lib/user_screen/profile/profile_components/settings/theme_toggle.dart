import 'package:flutter/material.dart';
import 'action_chips.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.20,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text(
                'Theme',
                textScaleFactor: 1.2,
              ),
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
          ),
          const SliverFillRemaining(
            child: ThemeAction(),
          ),
        ],
      ),
    );
  }
}
