import 'package:flutter/material.dart';
import 'package:techka/models/profile_list.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

final ProfileList profileList = ProfileList();

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        elevation: 0,
        title: const Text('Account'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: profileList.profileList.length,
          itemBuilder: (context, index) {
            return profileList.getWidget(index);
          },
        ),
      ),
    );
  }
}
