import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pluto/config/config.dart' as CONFIG;
import 'package:flutter/foundation.dart';
import 'package:pluto/screens/mobile/mobile_home.dart';
import 'package:pluto/screens/tablet/tablet_home.dart';
import 'package:pluto/screens/web/web_home.dart';

class Home extends StatefulWidget{
  @override
  HomeState createState()=>HomeState();
}

class HomeState extends State<Home>{

  bool isDrawerOpen = false;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: SafeArea(
       top: true,
       child: LayoutBuilder(
         builder: (BuildContext context, BoxConstraints constraints){
           if(constraints.maxWidth<=CONFIG.MOBILE_SCREEN_SIZE){
             //device is mobile
             return MobileHome();
           } else if(constraints.maxWidth>CONFIG.MOBILE_SCREEN_SIZE && constraints.maxWidth<=CONFIG.TABLET_SCREEN_SIZE){
             //device is tablet
             return TabletHome();
           } else {
             //device is web
             return WebHome();
           }
         }
       ),
     ),
   );
  }
}