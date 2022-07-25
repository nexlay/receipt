import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techka/components/progress_indicator.dart';
import '../../../models/receipt.dart';
import '../../../utils/authentication/authentication.dart';
import '../../../utils/database/storage.dart';

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
        actions: [
          IconButton(
            onPressed: () {
              Storage(
                      uid: Auth().firebaseAuth.currentUser?.uid,
                      imageName: receipt.name)
                  .deleteReceipt();
              Future.delayed(const Duration(seconds: 1), () {
                Navigator.pop(context);
              });
            },
            icon: const Icon(Icons.delete),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          ),
        ],
      ),
      body:receipt.url != '' ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
             InteractiveViewer(
                  child: Container(
                    width: 600,
                    height: 600,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(receipt.url), fit: BoxFit.fill),
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
      ) :  const TechkaProgressIndicator(),
    );
  }
}
