import 'package:flutter/material.dart';
import 'package:techka/user_screen/profile/profile_components/settings/settings.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Settings'),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const MySettings()));
      },
    );
  }
}
