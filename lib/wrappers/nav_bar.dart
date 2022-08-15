import 'package:flutter/material.dart';
import 'package:techka/models/nav_bar_items.dart';

class StartPage extends StatefulWidget {
  const StartPage({
    Key? key,
  }) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final NavBarItem _navBarItem = NavBarItem();

  int _selectedIndex = 0;

  int _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    return _selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: const IconThemeData(size: 24.0),
        unselectedIconTheme: const IconThemeData(size: 28.0),
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Journal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        //selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      body: Center(
        child: _navBarItem.getWidget(_selectedIndex),
      ),
    );
  }
}
