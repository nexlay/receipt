import 'package:flutter/material.dart';
import '../../../utils/database/storage.dart';
import '../utils/authentication/authentication.dart';

enum ConfirmAction { Cancel, OK }
class ConfirmAlertDialog {
  Future<ConfirmAction?> asyncConfirmDialog(
      BuildContext context, String name) async {
    return showDialog<ConfirmAction>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete this receipt?'),
          content: const Text('This will delete the receipt from your device.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(ConfirmAction.Cancel);
              },
            ),
            TextButton(
              child: const Text('OK'),
              onPressed: ()  {
                 Storage(uid: Auth().retrieveCurrentUserId(), imageName: name)
                    .deleteReceipt();
                Navigator.of(context).pop(ConfirmAction.OK);
              },
            )
          ],
        );
      },
    );
  }
}

