import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techka/user_screen/home/components/receipt_details.dart';
import 'package:techka/utils/database/db_service.dart';
import '../../../models/receipt.dart';
import '../../../utils/authentication/authentication.dart';

class ReceiptDetailsProvider extends StatelessWidget {
  const ReceiptDetailsProvider({Key? key, required this.receiptName}) : super(key: key);
final String receiptName;
  @override
  Widget build(BuildContext context) {

    return StreamProvider<Receipt>.value(
      initialData: Receipt(url: '', name: '', shop: '', sum: ''),
      value: DatabaseService(uid: Auth().retrieveCurrentUserId(), receiptName: receiptName).receipt,
      child: const ReceiptDetails(),
    );
  }
}
