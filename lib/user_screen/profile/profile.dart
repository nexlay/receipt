import 'package:flutter/material.dart';
import 'package:techka/user_screen/profile/profile_components/account_tile.dart';
import 'package:techka/user_screen/profile/profile_components/sign_out_btn.dart';
import 'package:techka/user_screen/profile/profile_components/settings_tile.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.20,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text(
                'Profile',
                textScaleFactor: 1.2,
              ),
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const Account(),
                const SizedBox(height: 40.0,),
                const SettingsTile(),
                const SizedBox(height: 40.0,),
                SignOutBtn(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
