import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pluto/config/config.dart' as CONFIG;
import 'package:flutter/foundation.dart';
import 'package:pluto/screens/mobile/mobile_market_place.dart';
import 'package:pluto/screens/tablet/tablet_market_place.dart';
import 'package:pluto/screens/web/web_marlet_place.dart';

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
                return Mobile_Marketplace();
              } else if(constraints.maxWidth>CONFIG.MOBILE_SCREEN_SIZE && constraints.maxWidth<=CONFIG.TABLET_SCREEN_SIZE){
                //device is tablet
                return Tablet_Marketplace();
              } else {
                //device is web
                return Web_Marketplace();
              }
            }
        ),
      ),
    );
  }
}