import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/Btns/primaryBtn.dart';
import '../components/avatar.dart';
import '../components/scroll_behaviour.dart';
import '../components/search_bar.dart';
import 'home.dart';
import 'package:pluto/config/config.dart' as CONFIG;

class NotificationPage extends StatefulWidget {
  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List notifications = [
    "t is used to develop applications ",
    "method of creating applications",
    "A beautiful, extreme smooth and quite nice shoping app interface UI by using Dart + Flutter. Having wonderful animation. shopping-cart amazon shopping ...",
    "t is used to develop applications ",
    "method of creating applications",
    "t is used to develop applications ",
    "method of creating applications",
  ];


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
        itemCount: notifications.length, itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(top: 20, left: 10),
              child: Container(
                width: 125,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[100],
                ),
                    child: Row(
                      children:[
                       Avatar(size: 60, ImageURL: '',),
                         Padding(
                           padding: const EdgeInsets.only(top: 20, left: 15),
                           child: Column(
                             children: [
                               Text("User Name" , style: TextStyle(fontSize: 20, ),),
                               SizedBox(height: 5,),
                               Container(
                                   width: MediaQuery.of(context).size.width-95,
                                   child: Text(notifications[index]))
                             ],
                           ),
                         )


                    ],
                    ),
                  ),
            
              );
        });
   

  }
}
