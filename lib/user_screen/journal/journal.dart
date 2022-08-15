import 'package:flutter/material.dart';
import 'package:techka/components/custom_scroll_view.dart';

import '../../components/custom_sliver_header.dart';

class Journal extends StatelessWidget {
  const Journal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReceiptCustomScrollView(
        title: 'Journal',
        childWidget: SliverList(
          delegate: SliverChildListDelegate(
            [
              SliverHeader(subtitle: Padding(
                padding: EdgeInsets.all(6.0),
                child: const Text(
                  '',
                  textAlign: TextAlign.justify,
                ),
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
