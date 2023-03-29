import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pluto/screens/mobile/mobile_user_profile.dart';
import 'package:pluto/screens/tablet/tablet_user_profile.dart';
import 'package:pluto/screens/web/web_user_profile.dart';
import 'package:pluto/config/config.dart' as CONFIG;

class User_Profile extends StatefulWidget{
  @override
  User_ProfileState createState()=>User_ProfileState();
}

class User_ProfileState extends State<User_Profile>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints){
              if(constraints.maxWidth<=CONFIG.MOBILE_SCREEN_SIZE){
                //device is mobile
                return Mobile_UserProfile();
              } else if(constraints.maxWidth>CONFIG.MOBILE_SCREEN_SIZE && constraints.maxWidth<=CONFIG.TABLET_SCREEN_SIZE){
                //device is tablet
                return Tablet_UserProfile();
              } else {
                //device is web
                return Web_UserProfile();
              }
            }
        ),
      ),
    );
  }
}