import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pluto/components/Btns/customBtn.dart';
import 'package:pluto/components/avatar.dart';
import 'package:pluto/screens/user_profile_form.dart';
import 'package:share/share.dart';
import '../../components/follow_list.dart';
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
  String onTabActive = 'activity';

  double xOffset = 0;
  double yOffset = 0;
  double scalefactor = 1;
  bool isDrawerOpen = false;
  XFile file = XFile("");
  String filePath = "";

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
                  title: Padding(
                    padding: const EdgeInsets.only(right: 250, top: 7),
                    child: Text("Profile", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  ),
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Avatar(
                    size: 100,
                    ImageURL:
                        // "https://s3-prod.dogtopia.com/wp-content/uploads/2019/03/0.jpg"
                  SESSION.profileUrl,
                  ImageFile: file,
                  isFile: file.path != "" ? true : false,
                  ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Center(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "293",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Posts',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>FollowList(profileURL: '', username: 'Username',)));
                                  },
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
                                          fontSize: 14,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>FollowList(profileURL: '', username: 'Username',)));
                                },
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
                                      'Following',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, top: 15, right: 210),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                  SESSION.firstName + " " + SESSION.lastName,
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
                        TextSpan(text: SESSION.description),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> UserProfileForm())),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: CONFIG.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: CustomBtn(
                        height: 40,
                        width: 155,
                        buttonTitle: "Edit Profile",
                        color: CONFIG.primaryColor),
                  ),
                ),

                InkWell(
                  onTap: (){
                    Share.share("http://play.google.com/store/apps/details?id=com.instructivetech.testapp");
                  },
                  child: Padding(
                    padding: EdgeInsets.only( right: 10),
                    child: CustomBtn(
                       borderRadius: 10,
                        height: 40,
                        width: 155,
                        buttonTitle: "Share profile",
                        color: CONFIG.primaryColor),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            endIndent: 5,
            indent: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      onTabActive = "activity";
                    });
                  },
                  child: Row(
                    children: [
                      Icon(Icons.table_chart_outlined, size:18, color: onTabActive == "activity"? CONFIG.primaryColor:Colors.grey),
                      SizedBox( width: 5),
                      Text("Activity",
                        style: TextStyle(
                            color: onTabActive == "activity"
                                ? CONFIG.primaryColor
                                : Colors.grey))
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      onTabActive="More";
                    });
                  },
                  child: Row(
                    children: [
                      Icon(Icons.read_more,size: 20,color:onTabActive=="More"?CONFIG.primaryColor:Colors.grey),
                      SizedBox(width: 5,),
                      Text("More", style: TextStyle(color: onTabActive=="More"?CONFIG.primaryColor:Colors.grey),)
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
            ),
    );


  }
}
