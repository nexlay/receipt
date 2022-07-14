import 'package:flutter/material.dart';
import 'package:techka/user_screen/journal/journal.dart';
import 'package:techka/user_screen/profile/profile.dart';
import '../user_screen/home/home.dart';

class NavBarItem {
  final List<Widget> _screenOption = [
    const Home(),
    const Journal(),
    const Profile(),
  ];

  Widget getWidget (int index) {
    return _screenOption.elementAt(index);
  }
}
