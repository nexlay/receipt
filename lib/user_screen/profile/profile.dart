import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techka/models/local_user.dart';
import 'package:techka/user_screen/profile/profile_components/profile_list.dart';
import '../../utils/authentication/authentication.dart';
import '../../utils/database/db_service.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<LocalUser>.value(
      value:
          DatabaseService(uid: Auth().firebaseAuth.currentUser?.uid).userData,
      initialData: LocalUser(name: '', surname: '', imageUrl: ''),
      child: const Scaffold(
        body: ProfileList(),
      ),
    );
  }
}
