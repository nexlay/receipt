import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techka/user_screen/home/components/receipt_details_provider.dart';

import '../../../components/progress_indicator.dart';
import '../../../models/receipt.dart';



class ReceiptCard extends StatelessWidget {
  const ReceiptCard({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    final receipts = Provider.of<List<Receipt>>(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child:
        Material(
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
               // other widget
            ),
          ),
        ),
      ),
    ) /*: const TechkaProgressIndicator()*/;
  }
}
