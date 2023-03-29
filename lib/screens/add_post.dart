import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pluto/screens/mobile/mobile_add_post.dart';
import 'package:pluto/screens/tablet/tablet_add_post.dart';
import 'package:pluto/screens/web/web_add_post.dart';
import 'package:pluto/config/config.dart' as CONFIG;

class Addpost extends StatefulWidget{
  @override
  AddpostState createState()=>AddpostState();
}

class AddpostState extends State<Addpost>{
  double xOffset = 0;
  double yOffset = 0;
  double scalefactor = 1;
  bool isDrawerOpen = false;

  void toggleMenu() {
    bool tmpStatus=!isDrawerOpen;
    setState(() {
      xOffset=tmpStatus?250:0;
      yOffset=tmpStatus?50:0;
      scalefactor=tmpStatus?0.91:1;
      isDrawerOpen=tmpStatus;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints){
              if(constraints.maxWidth<=CONFIG.MOBILE_SCREEN_SIZE){
                //device is mobile
                return Mobile_Addpost();
              } else if(constraints.maxWidth>CONFIG.MOBILE_SCREEN_SIZE && constraints.maxWidth<=CONFIG.TABLET_SCREEN_SIZE){
                //device is tablet
                return Tablet_Addpost();
              } else {
                //device is web
                return Web_Addpost();
              }
            }
        ),
      ),
    );
  }
}