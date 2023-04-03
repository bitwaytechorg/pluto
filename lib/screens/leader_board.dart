import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pluto/config/config.dart' as CONFIG;
import 'package:pluto/screens/tablet/tablet_leaderboard.dart';
import 'package:pluto/screens/web/web_leaderboard.dart';

import 'mobile/mobile_leaderboard.dart';

class Leaderboard extends StatefulWidget{
  @override
  LeaderboardState createState()=>LeaderboardState();
}

class LeaderboardState extends State<Leaderboard>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints){
              if(constraints.maxWidth<=CONFIG.MOBILE_SCREEN_SIZE){
                //device is mobile
                return Mobile_Leaderboard();
              } else if(constraints.maxWidth>CONFIG.MOBILE_SCREEN_SIZE && constraints.maxWidth<=CONFIG.TABLET_SCREEN_SIZE){
                //device is tablet
                return Tablet_Leaderboard();
              } else {
                //device is web
                return Web_Leaderboard();
              }
            }
        ),
      ),
    );
  }
}