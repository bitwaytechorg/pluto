import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pluto/screens/mobile/mobile_information.dart';
import 'package:pluto/screens/tablet/tablet_home.dart';
import 'package:pluto/screens/tablet/tablet_information.dart';
import 'package:pluto/screens/web/web_home.dart';
import 'package:pluto/config/config.dart' as CONFIG;
import 'package:pluto/screens/web/web_information.dart';

import 'mobile/mobile_home.dart';

class InformationPage extends StatefulWidget{
  @override
  InformationPageState createState()=>InformationPageState();
}

class InformationPageState extends State<InformationPage>{
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
                return Mobile_Information();
              } else if(constraints.maxWidth>CONFIG.MOBILE_SCREEN_SIZE && constraints.maxWidth<=CONFIG.TABLET_SCREEN_SIZE){
                //device is tablet
                return Tablet_Information();
              } else {
                //device is web
                return Web_Information();
              }
            }
        ),
      ),
    );
  }
}