import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/Btns/primaryBtn.dart';
import '../components/scroll_behaviour.dart';
import '../components/search_bar.dart';
import 'home.dart';
import 'package:pluto/config/config.dart' as CONFIG;

class NotificationPage extends StatefulWidget {
  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  // List notifications = [
  //   "t is used to develop applications ",
  //   "method of creating applications",
  //   "t is used to develop applications ",
  //   "method of creating applications",
  //   "t is used to develop applications ",
  //   "method of creating applications",
  // ];
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
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Home()));
                              },
                              child:
                                  Icon(Icons.arrow_back, color: Colors.grey)),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Notifications",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,),
              child: Row(
                children: [
                  SizedBox(width: 25,),
                  Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        border: Border.all(width: 1, color: CONFIG.primaryColor.withAlpha(100)),

                      ),
                      child: Icon(Icons.more_vert_sharp, color: CONFIG.primaryColor, size: 25,)
                  )
                ],
              ),
            ),

          ]),
              ),

              Divider(color: Colors.grey),
              SearchBar(width: 470, onSearch: (String searchText) {  },),
               Expanded(
                   child: BuildContent()),
      ],
    ),
          ),
      ),
        );
  }

  BuildContent() {
   return ListView.builder(
        shrinkWrap: true,
        scrollDirection:Axis.vertical,
        itemCount: 50, itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(top: 20, left: 10),
              child: Container(
                height: 120,
                width: 125,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[100],
                ),
                    child: Padding(
                      padding: EdgeInsets.only( left: 15),
                      child: Row(
                        children:[
                          Container(
                          child: Icon(
                            FontAwesomeIcons.circleUser,
                            size: 35,
                            color: Colors.black87,
                          ),
                        ),
                           Padding(
                             padding: EdgeInsets.only(left: 30,bottom: 30),
                             child: Text("HELLO USER ", style: TextStyle(fontSize: 20),)),
                          Padding(
                            padding: EdgeInsets.only(top: 25),
                            child: Container(
                              child: Text("Welcome to this page."),
                            ),
                          )

                    ],
                      ),
                    ),
                  ),
            
              );
        });
   

  }
}
