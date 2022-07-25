import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techka/components/custom_scroll_view.dart';
import 'package:techka/models/receipt.dart';
import 'package:techka/user_screen/home/components/receipt_picker.dart';
import 'package:techka/user_screen/home/components/receipt_card.dart';
import '../../../components/floating_action_btn.dart';

class HomeReceiptList extends StatelessWidget {
  const HomeReceiptList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final receipts = Provider.of<List<Receipt>>(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: receipts.isNotEmpty ? 1.0 : 0.0,
        child: const MyFloatingActionBtn(),
      ),
      body: TechkaCustomScrollView(
        title: 'Home',
        childWidget: receipts.isNotEmpty
            ? SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, int index) {
                    return ReceiptCard(
                      index: index,
                    );
                  },
                  childCount: receipts.length,
                ),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200.0,
                  mainAxisExtent: 200.0,
                  mainAxisSpacing: 5.0,
                  crossAxisSpacing: 5.0,
                  childAspectRatio: 2.0,
                ),
              )
            : const SliverFillRemaining(
                child: ReceiptPicker(),
              ),
      ),
    );
  }
}
