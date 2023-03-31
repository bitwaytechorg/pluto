import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pluto/components/Btns/customBtn.dart';
import 'package:pluto/components/avatar.dart';
import '../../components/Btns/secondaryBtn.dart';
import '../../components/scroll_behaviour.dart';
import '../../components/slider_menu.dart';
import '../../components/topbar.dart';
import 'package:pluto/config/config.dart' as CONFIG;
import 'package:pluto/global/session.dart' as SESSION;

import '../home.dart';

class Mobile_UserProfile extends StatefulWidget {
  @override
  Mobile_UserProfileState createState() => Mobile_UserProfileState();
}

class Mobile_UserProfileState extends State<Mobile_UserProfile> {
  List chips = [
    '#design',
    '#computer',
    '#flutter',
    '#virtual',
    '#reality',
    '#beauty',
    '#public',
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
                  isMainPage: false,
                  onTap: () => Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => Home())),
                  background: Colors.transparent,
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
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Avatar(
                    size: 100,
                    ImageURL:
                        "https://s3-prod.dogtopia.com/wp-content/uploads/2019/03/0.jpg"),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(45.0),
                  child: Container(
                    child: Center(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "200",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Posts',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Column(
                                  children: [
                                    Text(
                                      "200K",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Followers',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    "200K",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Following',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          // Padding(
                          //   padding:
                          //       const EdgeInsets.only( right: 8, top: 15),
                          //   child: Row(
                          //     children: [
                          //       SecondaryBtn(buttonTitle: "Follow"),
                          //       SizedBox(
                          //         width: 10,
                          //       ),
                          //       SecondaryBtn(buttonTitle: "Message")
                          //     ],
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 5, top: 15, right: 225),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bhumika Tiwari",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 15, bottom: 10),
                      child: SizedBox(height: 5)),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                          color: Colors.black.withAlpha(120), fontSize: 15),
                      children: <TextSpan>[
                        TextSpan(text: 'Chandigarh, India             '),
                        TextSpan(text: 'Flutter Developer'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8, right: 8, top: 15),
            child: Row(
              children: [
                CustomBtn(
                  height: 40,
                  width: 180,
                  buttonTitle: "Edit Profile", color: CONFIG.primaryColor),
                SizedBox(
                  width: 30,
                ),
                CustomBtn(
                  height: 40,
                  width: 180,
                  buttonTitle: "Share Profile", color: CONFIG.primaryColor),
              ],
            ),
          )
        ],
      ),
    );
  }
}
