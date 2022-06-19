import 'package:flutter/cupertino.dart';
import 'package:techka/user_screen/profile/profile_components/sign_out_btn.dart';

import '../user_screen/profile/profile_components/header.dart';

class ProfileList{
 final List<Widget> profileList = [
  Account(),
   SignOutBtn(),
 ];

 Widget getWidget (int index){
   return profileList.elementAt(index);
 }

}