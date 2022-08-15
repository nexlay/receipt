import 'package:flutter/material.dart';

class ReceiptCustomScrollView extends StatelessWidget {
  final String title;
  final Widget childWidget;
  final Widget? persistentHeaderWidget;
  const ReceiptCustomScrollView(
      {Key? key,
      required this.title,
      required this.childWidget,
      this.persistentHeaderWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          elevation: 0.0,
          pinned: true,
          floating: false,
          snap: false,
          expandedHeight: MediaQuery.of(context).size.height * 0.15,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding:
                const EdgeInsets.only(top: 8.0, left: 72.0, bottom: 8.0),
            title: Text(
              title,
              textScaleFactor: 1.2,
            ),
          ),
        ),
        SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            sliver: childWidget),
      ],
    );
  }
}
