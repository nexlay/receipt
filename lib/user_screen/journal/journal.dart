import 'package:flutter/material.dart';

class Journal extends StatelessWidget {
  const Journal({Key? key}) : super(key: key);

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
                'Journal',
                textScaleFactor: 1.2,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
              ],
            ),
          ),
        ],
      ),
    );
  }
}
