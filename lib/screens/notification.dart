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
  // List notifications = [
  //   "It is used to develop applications,A beautiful, extreme smooth and quite nice shoping app interface UI by using Dart + Flutter.It is used to develop applications.A beautiful, extreme smooth and quite nice shoping app interface UI by using Dart + Flutter.",
  //   "method of creating applications.A beautiful, extreme smooth and quite nice shoping app interface UI by using Dart + Flutter.It is used to develop applications.A beautiful, extreme smooth and quite nice shoping app interface UI by using Dart + Flutter.",
  //   "A beautiful, extreme smooth and quite nice shoping app interface UI by using Dart + Flutter.It is used to develop applications.A beautiful, extreme smooth and quite nice shoping app interface UI by using Dart + Flutter.",
  //   "It is used to develop applications.A beautiful, extreme smooth and quite nice shoping app interface UI by using Dart + Flutter. It is used to develop applications.A beautiful, extreme smooth and quite nice shoping app interface UI by using Dart + Flutter.",
  //   "method of creating applications.A beautiful, extreme smooth and quite nice shoping app interface UI by using Dart + Flutter.It is used to develop applications.A beautiful, extreme smooth and quite nice shoping app interface UI by using Dart + Flutter.",
  //   "It is used to develop applications.A beautiful, extreme smooth and quite nice shoping app interface UI by using Dart + Flutter. ",
  //   "method of creating applications.A beautiful, extreme smooth and quite nice shoping app interface UI by using Dart + Flutter.",
  //   "It is used to develop applications.A beautiful, extreme smooth and quite nice shoping app interface UI by using Dart + Flutter.",
  //   "method of creating applications.A beautiful, extreme smooth and quite nice shoping app interface UI by using Dart + Flutter.It is used to develop applications.A beautiful, extreme smooth and quite nice shoping app interface UI by using Dart + Flutter.",
  //   "It is used to develop applications.A beautiful, extreme smooth and quite nice shoping app interface UI by using Dart + Flutter.It is used to develop applications.A beautiful, extreme smooth and quite nice shoping app interface UI by using Dart + Flutter. ",
  //
  // ];
  List days = [
    "Today",
    "This week",
    "This month",
    "Earlier",
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
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(40)),
                                  border: Border.all(width: 1,
                                      color: CONFIG.primaryColor.withAlpha(
                                          100)),

                                ),
                                child: InkWell(
                                    onTap: () => {},
                                    child: Icon(Icons.more_vert_sharp,
                                      color: CONFIG.primaryColor, size: 25,))
                            )
                          ],
                        ),
                      ),

                    ]),
              ),

              Divider(color: Colors.grey),
              Expanded(
                  child: buildContent()),
            ],
          ),
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
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Avatar(size: 80,
                        ImageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReSQp9MqQWLBsNJQ0C9OA4uSKKkqlI6-hUog&usqp=CAU"),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 200,bottom: 5),
                        child: Text("Follow Request", style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 145,),
                        child: Text("Approve or ignore request", style: TextStyle(fontSize: 13),),
                      ),

                    ],
                  ),
                ),



                // BuildContent() {
                // return ListView.builder(
                //      shrinkWrap: true,
                //      scrollDirection:Axis.vertical,
                //      itemCount: notifications.length, itemBuilder: (BuildContext context, int index) {
                //        return Padding(
                //          padding: const EdgeInsets.only(top: 20, left: 10,),
                //            child: Container(
                //              width: 125,
                //              decoration: BoxDecoration(
                //                borderRadius: BorderRadius.circular(5),
                //                color: Colors.grey[100],
                //              ),
                //                  child: Column(
                //                    children: [
                //                      Column(
                //                        children: [
                //                          Padding(
                //                            padding: EdgeInsets.only(top: 5, left: 300,),
                //                            child: Text("2 Apr",),
                //                          ),
                //                          Row(
                //                            children:[
                //                             Avatar(size: 65, ImageURL: '',),
                //                               Column(
                //                                 children: [
                //                                   Text("User Name" , style: TextStyle(fontSize: 20, ),
                //                                   ),
                //                                   SizedBox(height: 10,),
                //                                   Padding(
                //                                     padding: const EdgeInsets.only(left: 20,),
                //                                     child: Container(
                //                                         width: MediaQuery.of(context).size.width-110,
                //                                         child: Text(notifications[index], style: TextStyle(fontSize: 13),)),
                //                                   )
                //                                 ],
                //                               )],
                //                          ),
                //                        ],
                //                      ),
                //                      Padding(
                //                        padding: const EdgeInsets.only(bottom: 10, left: 10, top: 25),
                //                        child: Row(
                //                          children: [
                //                            Text(" Marked as read", style: TextStyle(fontSize: 15),),
                //                            Padding(
                //                              padding: const EdgeInsets.only(left: 240),
                //                              child: Icon(FontAwesomeIcons.trashCan, size: 20,),
                //                            ),
                //
                //                          ],
                //                        ),
                //                      )
                //
                //                    ],
                //
                //                  ),
                //                ),
                //
                //            );
                //      });
                //
              ]
          ),
        ],
      ),
    );

  }
}
