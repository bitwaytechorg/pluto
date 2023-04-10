import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pluto/screens/mobile/mobile_pet_finder.dart';
import 'package:pluto/screens/tablet/tablet_pet_finder.dart';
import 'package:pluto/config/config.dart' as CONFIG;
import 'package:pluto/screens/web/web_pet_finder.dart';

class PetFinder extends StatefulWidget{
  @override
  PetFinderState createState()=>PetFinderState();
}

class PetFinderState extends State<PetFinder>{
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
                return Mobile_PetFinder();
              } else if(constraints.maxWidth>CONFIG.MOBILE_SCREEN_SIZE && constraints.maxWidth<=CONFIG.TABLET_SCREEN_SIZE){
                //device is tablet
                return Tablet_PetFinder();
              } else {
                //device is web
                return Web_PetFinder();
              }
            }
        ),
      ),
    );
  }
}