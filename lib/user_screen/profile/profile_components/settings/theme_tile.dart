import 'package:flutter/material.dart';
import 'package:techka/user_screen/profile/profile_components/settings/theme_toggle.dart';

class ThemeTile extends StatelessWidget {
  const ThemeTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Theme'),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const ThemeToggle()));
      },
    );
  }
}
