import 'package:flutter/material.dart';
import 'package:techka/components/custom_scroll_view.dart';
import 'package:techka/user_screen/profile/profile_components/account_tile.dart';
import 'package:techka/user_screen/profile/profile_components/sign_out_btn.dart';
import 'package:techka/user_screen/profile/profile_components/settings_tile.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TechkaCustomScrollView(
        title: 'Profile',
        childWidget: SliverList(
          delegate: SliverChildListDelegate(
            [
              const Account(),
              const SizedBox(
                height: 40.0,
              ),
              const SettingsTile(),
              const SizedBox(
                height: 40.0,
              ),
              SignOutBtn(),
            ],
          ),
        ),
      ),
    );
  }
}
