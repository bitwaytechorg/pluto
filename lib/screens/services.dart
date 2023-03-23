import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pluto/config/config.dart' as CONFIG;
import 'package:flutter/foundation.dart';
import 'package:pluto/screens/mobile/mobile_Services.dart';
import 'package:pluto/screens/tablet/tablet_Services.dart';
import 'package:pluto/screens/web/web_Services.dart';

class Services extends StatefulWidget{
  @override
  ServicesState createState()=>ServicesState();
}

class ServicesState extends State<Services>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints){
              if(constraints.maxWidth<=CONFIG.MOBILE_SCREEN_SIZE){
                //device is mobile
                return Mobile_Services();
              } else if(constraints.maxWidth>CONFIG.MOBILE_SCREEN_SIZE && constraints.maxWidth<=CONFIG.TABLET_SCREEN_SIZE){
                //device is tablet
                return Tablet_Services();
              } else {
                //device is web
                return Web_Services();
              }
            }
        ),
      ),
    );
  }
}