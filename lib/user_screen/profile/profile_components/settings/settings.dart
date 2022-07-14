import 'package:flutter/material.dart';
import 'package:techka/user_screen/profile/profile_components/settings/theme_tile.dart';

class MySettings extends StatelessWidget {
  const MySettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0.0,
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.20,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text(
                'Settings',
                style: TextStyle(color: Colors.black),
                textScaleFactor: 1.2,
              ),
            ),
          ),
          const SliverPadding(padding: EdgeInsets.symmetric(vertical: 8.0),),
          SliverList(
            delegate: SliverChildListDelegate(
              [
             const ThemeTile(),
              ],
            ),
          ),
        ],

      ),
    );
  }
}
