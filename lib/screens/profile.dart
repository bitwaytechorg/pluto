import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pluto/config/config.dart' as CONFIG;
import 'package:flutter/foundation.dart';
import 'package:pluto/screens/mobile/mobile_Profile.dart';
import 'package:pluto/screens/tablet/tablet_Profile.dart';
import 'package:pluto/screens/web/web_Profile.dart';

class Profile extends StatefulWidget{
  @override
  ProfileState createState()=>ProfileState();
}

class ProfileState extends State<Profile>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints){
              if(constraints.maxWidth<=CONFIG.MOBILE_SCREEN_SIZE){
                //device is mobile
                return Mobile_Profile();
              } else if(constraints.maxWidth>CONFIG.MOBILE_SCREEN_SIZE && constraints.maxWidth<=CONFIG.TABLET_SCREEN_SIZE){
                //device is tablet
                return Tablet_Profile();
              } else {
                //device is web
                return Web_Profile();
              }
            }
        ),
      ),
    );
  }
}
