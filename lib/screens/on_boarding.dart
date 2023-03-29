import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pluto/config/config.dart' as CONFIG;
import 'package:pluto/screens/tablet/tablet_onboarding.dart';
import 'package:pluto/screens/web/web_onboarding.dart';

import 'mobile/mobile_onboarding.dart';


class on_boarding extends StatefulWidget{
  @override
  on_boardingState createState()=>on_boardingState();
}

class on_boardingState extends State<on_boarding>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints){
              if(constraints.maxWidth<=CONFIG.MOBILE_SCREEN_SIZE){
                //device is mobile
                return Mobile_onboarding();
              } else if(constraints.maxWidth>CONFIG.MOBILE_SCREEN_SIZE && constraints.maxWidth<=CONFIG.TABLET_SCREEN_SIZE){
                //device is tablet
                return Tablet_onboarding();
              } else {
                //device is web
                return Web_onboaring();
              }
            }
        ),
      ),
    );
  }
}