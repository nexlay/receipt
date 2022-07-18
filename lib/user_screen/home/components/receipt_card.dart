import 'package:flutter/material.dart';
import 'package:techka/user_screen/home/components/receipt_details_provider.dart';



class ReceiptCard extends StatelessWidget {
  const ReceiptCard({Key? key, required this.url, required this.receiptName}) : super(key: key);
  final String url;
  final String receiptName;



  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child:
        Material(
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                  image: NetworkImage(url), fit: BoxFit.cover),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReceiptDetailsProvider(receiptName: receiptName,),),
                );
              },
               // other widget
            ),
          ),
        ),
      ),
    );
  }
}
