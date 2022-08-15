import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techka/components/confirmation_alert_dialog.dart';
import 'package:techka/components/progress_indicator.dart';
import '../../../models/receipt.dart';


class ReceiptDetails extends StatefulWidget {
  const ReceiptDetails({Key? key}) : super(key: key);

  @override
  State<ReceiptDetails> createState() => _ReceiptDetailsState();
}

class _ReceiptDetailsState extends State<ReceiptDetails> {
  @override
  Widget build(BuildContext context) {
    final receipt = Provider.of<Receipt>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(receipt.date),
        actions: [
          IconButton(
            onPressed: () async {
             await ConfirmAlertDialog().asyncConfirmDialog(context, receipt.name);
             Future.delayed(Duration(seconds: 2)).whenComplete(() => Navigator.of(context).pop(),);
            },
            icon: const Icon(Icons.delete),
          ),
          IconButton(
            onPressed: () {
              //TODO Share user receipt
            },
            icon: const Icon(Icons.share),
          ),
        ],
      ),
      body: receipt.url.isNotEmpty ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
             InteractiveViewer(
                  child: Hero(
                    tag: '${receipt.name}',
                    child: Container(
                      width: 600,
                      height: 600,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(receipt.url), fit: BoxFit.fill),
                      ),
                    ),
                  ),
                ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  receipt.shop,
                  style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Suma paragonu: ${receipt.sum} PLN",
                  style: const TextStyle(fontSize: 20.0),
                ),
              ],
            ),
          ),
        ],
      ) :  const ReceiptProgressIndicator(),
    );
  }
}
