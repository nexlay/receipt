import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techka/models/receipt.dart';
import 'package:techka/user_screen/home/components/receipt_picker.dart';
import 'package:techka/user_screen/home/components/receipt_card.dart';
import '../../../components/floating_action_btn.dart';

class HomeReceiptList extends StatelessWidget {
  const HomeReceiptList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final receipt = Provider.of<List<Receipt>>(context);
    return Scaffold(
      floatingActionButton: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: receipt.isNotEmpty ? 1.0 : 0.0,
        child: const MyFloatingActionBtn(),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.20,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text(
                'Home',
                textScaleFactor: 1.2,
              ),
            ),
          ),
          const SliverPadding(padding: EdgeInsets.symmetric(vertical: 8.0),),
          receipt.isNotEmpty
              ? SliverGrid(
            delegate: SliverChildBuilderDelegate(
                  (context, int index) {
                return ReceiptCard(url: receipt[index].url, receiptName: receipt[index].name,);
              },
              childCount: receipt.length,
            ),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300.0,
              mainAxisExtent: 300.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 1.0,
            ),
          )
              : const SliverFillRemaining(
            child:
            ReceiptPicker(),
          ),
          const SliverPadding(padding: EdgeInsets.symmetric(vertical: 50.0),),
        ],
      ),
    );
  }
}
