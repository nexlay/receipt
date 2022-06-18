import 'package:flutter/material.dart';
import 'package:techka/components/bottom_nav_bar.dart';

import '../../services/receipt_source_picker.dart';


class StartPage extends StatelessWidget {
  const StartPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Home'),
      ),
      bottomNavigationBar: const MyBottomNavBar(),
      body: const ReceiptPicker(),
      //TODO: Make floating action button visible only if one receipt was added
      //floatingActionButton: const MyFloatingActionBtn(),
      //bottomNavigationBar: const MyBottomNavBar(),
    );
  }
}
