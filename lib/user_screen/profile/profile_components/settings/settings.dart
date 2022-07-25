import 'package:flutter/material.dart';
import 'package:techka/components/custom_scroll_view.dart';
import 'package:techka/user_screen/profile/profile_components/settings/theme_tile.dart';

class MySettings extends StatelessWidget {
  const MySettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TechkaCustomScrollView(
        title: 'Settings',
        childWidget: SliverList(
          delegate: SliverChildListDelegate(
            [
              const ThemeTile(),
            ],
          ),
        ),
      ),
    );
  }
}
