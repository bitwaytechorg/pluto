import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pluto/config/config.dart' as CONFIG;
import '../../components/avatar.dart';
import '../../components/notification_alert.dart';
import '../../components/scroll_behaviour.dart';
import '../../components/slider_menu.dart';
import '../../components/topbar.dart';

class Mobile_Leaderboard extends StatefulWidget {
  @override
  Mobile_LeaderboardState createState() => Mobile_LeaderboardState();
}

class Mobile_LeaderboardState extends State<Mobile_Leaderboard> {
  List batches=[
    "209",
    "201",
    "204",
    "194",
    "189",
    "138",
    "102",
    "145",
    "162",
    "189",
    "145",
    "162",
    "189",
    "138",
    "102",
    "145",
    "162",
  ];
  List points=[
    "9209",
    "9201",
    "8204",
    "7194",
    "7189",
    "6138",
    "7102",
    "6145",
    "6162",
    "5189",
    "4145",
    "3162",
    "2189",
    "6138",
    "7102",
    "6145",
    "6162",
  ];

  List petOwners = [
    "Dileep","Aaryan",
    "Carolyn","Morgan",
    "Lois","Wilson",
    "Ernest","Rogers",
    "Theresa","Patterson",
    "Henry","Simmons",
    "Michelle",
    "Ernest","Rogers",
    "Theresa","Patterson",
  ];

  double xOffset = 0;
  double yOffset = 0;
  double scalefactor = 1;
  bool isDrawerOpen = false;

  void toggleMenu() {
    bool tmpStatus = !isDrawerOpen;
    setState(() {
      xOffset = tmpStatus ? 250 : 0;
      yOffset = tmpStatus ? 50 : 0;
      scalefactor = tmpStatus ? 0.91 : 1;
      isDrawerOpen = tmpStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Slider_menu(),
            AnimatedContainer(
              width: MediaQuery.of(context).size.width,
              transform: Matrix4.translationValues(xOffset, yOffset, 0)
                ..scale(scalefactor)
                ..rotateY(isDrawerOpen ? -0.5 : 0),
              duration: Duration(milliseconds: 250),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0)),
              child: Column(children: [
                TopBar(
                  isDrawerOpen: isDrawerOpen,
                  onTap: toggleMenu,
                  background: Colors.transparent,
                  secondaryWidget: InkWell(
                      onTap: () => {},
                      child: Container(
                        margin: EdgeInsets.only(top: 3, right: 5),
                        child: NotificationAlert(),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Rank", style: TextStyle(fontSize:14,  color: Colors.black54),),
                      // Avatar(size: 60, ImageURL: ''),
                      Text("Pet owner",style: TextStyle(fontSize:14,color: Colors.black54)),
                      Text("Points", style: TextStyle(fontSize:14,color: Colors.black54)),
                      Icon(FontAwesomeIcons.medal, size:20, color: Colors.red),

                    ],
                  ),
                ),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: SingleChildScrollView(
                      child: buildContent(),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  buildContent() {
    return Column(
      children: [

        ListView.builder(
          physics: ScrollPhysics(),
          itemCount: petOwners.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 45,
              width: MediaQuery.of(context).size.width-25,
              decoration: BoxDecoration(
                //color: CONFIG.secondaryColor.withAlpha(10),
                border: Border.all(width: 0.03 , color: CONFIG.primaryColor),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(index.toString(), style: TextStyle(color: Colors.black54),),
                 // Avatar(size: 60, ImageURL: ''),
                  Text(petOwners[index], style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),),
                  Text(points[index], style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),),
                  Text(batches[index], style: TextStyle(color: CONFIG.primaryColor, fontWeight: FontWeight.bold),
                  ),

                ],
              ),
            );
          },

        ),
      ],
    );
  }
}
