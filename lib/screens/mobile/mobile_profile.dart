import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pluto/components/Btns/primaryBtn.dart';
import 'package:pluto/components/Btns/secondaryBtn.dart';
import 'package:pluto/config/config.dart' as CONFIG;
import 'package:pluto/global/session.dart' as SESSION;
import 'package:pluto/components/avatar.dart';

import '../../components/chips.dart';
import '../../components/notification_alert.dart';
import '../../components/scroll_behaviour.dart';
import '../../components/search_bar.dart';
import '../../components/slider_menu.dart';
import '../../components/topbar.dart';

class Mobile_Profile extends StatefulWidget{


  @override
  Mobile_ProfileState createState()=> Mobile_ProfileState();
}

class Mobile_ProfileState extends State<Mobile_Profile>{
 String onTabActive ='activity';
  List chips =[
    "desing",
    "graphics",
    "computer",
    "flutter",
    "java",
    "python",
    "react",
    "developers",
    "responsive",
    "manager",
    "new work",
    "bootstrap",
    "html/css",
    "new"
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
                  secondaryWidget: SearchBar(width:MediaQuery.of(context).size.width-65 , onSearch: (String searchText) {  },)
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
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Avatar(size: 80, ImageURL:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReSQp9MqQWLBsNJQ0C9OA4uSKKkqlI6-hUog&usqp=CAU"),
              ),
              Column(
                children: [
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text("200K", style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),),
                          SizedBox(height:5),
                          Text('Friends', style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),)
                        ],
                      ),
                      Padding(

                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          children: [
                            Text("200K", style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),),
                            SizedBox(height:5),
                            Text('Followers', style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),)
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Text("200K", style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),),
                          SizedBox(height:5),
                          Text('Following', style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),)
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 15),
                    child: Row(
                      children: [
                        SecondaryBtn(buttonTitle:"Follow"),
                        SizedBox(width: 10,),
                        SecondaryBtn(buttonTitle: "Message")
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 18),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Dileep Kumar",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 10, top:10),
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.black.withAlpha(120), fontSize: 15),
                children: <TextSpan>[
                  TextSpan(text: 'flutter developer ', style: TextStyle(color: Colors.blue)),
                  TextSpan(text: 'wordpress developer'),
                  TextSpan(text: ' web developer', style: TextStyle(decoration: TextDecoration.underline))
                ],
              ),
            ),
          ),

          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: chips.length,
                itemBuilder: (context,index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                    child: Chips(chipTitle: chips[index],),
                  );
                }
            ),
          ),


          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          //   child: Row(
          //     children: [
          //       PrimaryBtn(ButtonTitle: 'store', width: 260,height: 45,),
          //       SizedBox(width: 15,),
          //       Container(
          //           height: 42,
          //           width: 42,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.all(Radius.circular(40)),
          //             border: Border.all(width: 1, color: CONFIG.primaryColor.withAlpha(100)),
          //
          //           ),
          //           child: Icon(Icons.more_horiz, color: CONFIG.primaryColor, size: 20,)
          //       )
          //     ],
          //   ),
          // ),

          Divider(endIndent: 5, indent: 5,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          onTabActive="activity";
                        });
                      },
                      child: Row(
                        children: [
                          Icon(Icons.table_chart_outlined, color:onTabActive=="activity"?CONFIG.primaryColor:Colors.grey),
                          SizedBox(width: 5,),
                          Text("Activity",style: TextStyle(color: onTabActive=="activity"?CONFIG.primaryColor:Colors.grey),)
                        ],
                      ),
                    ),
                    SizedBox(width: 20,),

                    InkWell(
                      onTap: (){
                      setState(() {
                        onTabActive="about";
                      });
                      },
                      child: Row(
                        children: [
                          Icon(Icons.account_box_outlined, color:onTabActive=="about"?CONFIG.primaryColor:Colors.grey),
                          SizedBox(width: 5,),
                          Text("About", style: TextStyle(color: onTabActive=="about"?CONFIG.primaryColor:Colors.grey),)
                        ],
                      ),
                    ),
                  ],
                ),
                Icon(CupertinoIcons.slider_horizontal_3, color:Colors.grey),
              ],
            ),
          ),
          Divider(thickness: 1, endIndent: 5, indent: 5,),
        ],
      ),
    );
  }
}