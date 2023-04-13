import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pluto/config/config.dart' as CONFIG;
import 'package:pluto/screens/tablet/tablet_Settings.dart';
import 'package:pluto/screens/web/web_Settings.dart';

import 'mobile/mobile_Settings.dart';

class Settings extends StatefulWidget{
  @override
  SettingsState createState()=>SettingsState();
}

class SettingsState extends State<Settings>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints){
              if(constraints.maxWidth<=CONFIG.MOBILE_SCREEN_SIZE){
                //device is mobile
                return MobileSettings();
              } else if(constraints.maxWidth>CONFIG.MOBILE_SCREEN_SIZE && constraints.maxWidth<=CONFIG.TABLET_SCREEN_SIZE){
                //device is tablet
                return TabletSettings();
              } else {
                //device is web
                return WebSettings();
              }
            }
        ),
      ),
    );
  }
}
