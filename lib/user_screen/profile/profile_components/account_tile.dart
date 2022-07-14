import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:techka/utils/database/storage.dart';
import '../../../models/local_user.dart';
import '../../../services/media.dart';
import '../../../utils/authentication/authentication.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

final MediaService imgPicker = MediaService();

XFile? imageFile;
String imageUrl = '';

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    final localUser = Provider.of<LocalUser>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello ${localUser.name}', style: const TextStyle(fontSize: 20.0,),),
            Text(
              Auth().retrieveEmail().toString(),
            ),
          ],
        ),
        localUser.imageUrl != ''
            ? Material(
                elevation: 4.0,
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAlias,
                color: Colors.transparent,
                child: Ink.image(
                  image: NetworkImage(localUser.imageUrl),
                  fit: BoxFit.cover,
                  width: 80.0,
                  height: 80.0,
                  child: InkWell(
                    onTap: () async {
                      imageFile = await imgPicker.getImage(ImageSource.gallery, 1);
                      setState(
                        () {
                          Storage(
                                  uid: Auth().firebaseAuth.currentUser?.uid,
                                  imageName: imageFile!.name)
                              .uploadProfileImage(imageFile!.path);
                        },
                      );
                    },
                  ),
                ),
              )
            : IconButton(
          iconSize: 60.0,
                icon: const Icon(Icons.account_circle,
                    color: Colors.grey,),
                onPressed: () async {
                  imageFile = await imgPicker.getImage(ImageSource.gallery, 1);
                  setState(
                        () {
                      Storage(
                          uid: Auth().firebaseAuth.currentUser?.uid,
                          imageName: imageFile!.name)
                          .uploadProfileImage(imageFile!.path);
                    },
                  );
                },
              ),
      ],
    );
  }
}
