import 'package:flutter/material.dart';
class BrandImage extends StatelessWidget {
  const BrandImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return
      Row(
        children: [
           CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 50.0,
            foregroundImage:
             AssetImage('assets/icons/logo.png'),
    ),
          const SizedBox(width: 10.0,),
          Text('Receipt', style: TextStyle(color: Colors.blue.shade100, fontSize: 32.0, fontWeight: FontWeight.bold),),
        ],
      );
  }
}
