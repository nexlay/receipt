import 'package:flutter/material.dart';
import 'package:techka/components/custom_scroll_view.dart';
import 'package:techka/user_screen/profile/profile_components/settings/theme/theme_tile.dart';
import 'account edit/account_edit_tile.dart';

class MySettings extends StatelessWidget {
  const MySettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReceiptCustomScrollView(
        title: 'Settings',
        childWidget: SliverList(
          delegate: SliverChildListDelegate(
            [
              const AccountEdit(),
              const ThemeTile(),
            ],
          ),
        ),
      ),
    );
  }
}
