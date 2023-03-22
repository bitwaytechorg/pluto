import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pluto/config/config.dart' as CONFIG;
import 'package:flutter/foundation.dart';
import 'package:pluto/screens/mobile/mobile_social_page.dart';
import 'package:pluto/screens/tablet/tablet_Social_page.dart';
import 'package:pluto/screens/web/web_social_page.dart';

class Social_page extends StatefulWidget{
  @override
  Social_pageState createState()=>Social_pageState();
}

class Social_pageState extends State<Social_page>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints){
              if(constraints.maxWidth<=CONFIG.MOBILE_SCREEN_SIZE){
                //device is mobile
                return Mobile_Socialpage();
              } else if(constraints.maxWidth>CONFIG.MOBILE_SCREEN_SIZE && constraints.maxWidth<=CONFIG.TABLET_SCREEN_SIZE){
                //device is tablet
                return Tablet_Socialpage();
              } else {
                //device is web
                return Web_Socialpage();
              }
            }
        ),
      ),
    );
  }
}