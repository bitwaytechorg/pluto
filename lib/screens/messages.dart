import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pluto/config/config.dart' as CONFIG;
import 'package:pluto/screens/tablet/tablet_messages.dart';
import 'package:pluto/screens/web/web_messages.dart';

import 'mobile/mobile_messages.dart';


class Market_place extends StatefulWidget{
  @override
  Market_placeState createState()=>Market_placeState();
}

class Market_placeState extends State<Market_place>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints){
              if(constraints.maxWidth<=CONFIG.MOBILE_SCREEN_SIZE){
                //device is mobile
                return MobileMessages();
              } else if(constraints.maxWidth>CONFIG.MOBILE_SCREEN_SIZE && constraints.maxWidth<=CONFIG.TABLET_SCREEN_SIZE){
                //device is tablet
                return TabletMessages();
              } else {
                //device is web
                return WebMessages();
              }
            }
        ),
      ),
    );
  }
}