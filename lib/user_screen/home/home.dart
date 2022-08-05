import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techka/components/custom_scroll_view.dart';
import 'package:techka/models/receipt.dart';
import 'package:techka/user_screen/home/components/receipt_picker.dart';
import '../../../components/floating_action_btn.dart';
import 'components/receipt_details_provider.dart';

class HomeReceiptList extends StatelessWidget {
  const HomeReceiptList({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final receipts = Provider.of<List<Receipt>>(context);
    return Scaffold(
      floatingActionButton: AnimatedOpacity(
        duration: const Duration(seconds: 1),
        opacity: receipts.isNotEmpty ? 1.0 : 0.0,
        child: const MyFloatingActionBtn(),
      ),
      body: ReceiptCustomScrollView(
        title: 'Home',
        childWidget: receipts.isNotEmpty
            ? SliverGrid(
          delegate: SliverChildBuilderDelegate(
                (context, int index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child:
                  Hero(
                    tag: '${receipts[index].name}',
                    child:  Material(
                      child: Ink(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                              image: NetworkImage(receipts[index].url), fit: BoxFit.cover),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ReceiptDetailsProvider(receiptName: receipts[index].name,),),
                            );
                          },
                        ) ,
                      ),
                    ),
                  ),
                ),
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


