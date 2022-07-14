import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techka/models/receipt.dart';
import 'package:techka/utils/database/db_service.dart';
import '../../utils/authentication/authentication.dart';
import 'components/receipt_list.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {


    return StreamProvider<List<Receipt>>.value(
      value: DatabaseService(uid: Auth().firebaseAuth.currentUser?.uid).receipts,
      initialData: const [],
      child:  const ReceiptList(),
    );
  }
}
