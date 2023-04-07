import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/avatar.dart';
import '../components/cText.dart';
import '../components/scroll_behaviour.dart';
import 'package:pluto/components/notification.dart';
import 'home.dart';
import 'package:pluto/config/config.dart' as CONFIG;

class NotificationPage extends StatefulWidget {
  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List today = [
    "new massage",
    "Today It is used to develop app lica ti ons Today It is used to develop applications Today It is used to develop applications",
    "Today It is  to develop ap pli cati ons",
    "Today It is used to develop applications",
    "Today It is used to develop applications",
  ];

  List yesterday = [
    "new massage",
    "yesterday It is used to develop applications",
    "yesterday It is used to develop applications",
    "yesterday It is used to develop applications",
    "yesterday It is used to develop applications",
  ];

  List thisMonth = [
    "new massage",
    "thisMonth It is used to develop applications",
    "thisMonth It is used to develop applications",
    "thisMonth It is used to develop applications",
    "thisMonth It is used to develop applications",
  ];

  List Notification = [
    "Notification It is used to develop applications",
    "Notification It is used to develop applications",
    "Notification It is used to develop applications",
    "Notification It is used to develop applications",
    "Notification It is used to develop applications",
    "Notification It is used to develop applications",
    "It is used to develop applications",
    "It is used to develop applications",
    "It is used to develop applications",
    "It is used to develop applications",
    "It is used to develop applications",
  ];
  List time = [
    "1 hr",
    "3 hr",
    "5 hr",
    "10 hr",
    "20 hr",
    "24 hr",
  ];

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
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 25,
                            ),
                            Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                  border: Border.all(
                                      width: 1,
                                      color:
                                          CONFIG.primaryColor.withAlpha(100)),
                                ),
                                child: InkWell(
                                    onTap: () => {},
                                    child: Icon(
                                      Icons.more_vert_sharp,
                                      color: CONFIG.primaryColor,
                                      size: 25,
                                    )))
                          ],
                        ),
                      ),
                    ]),
              ),
              Divider(color: Colors.grey),
              Expanded(
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: SingleChildScrollView(
                  child: buildContent(),
                ),
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildContent() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 15, top: 10, bottom: 5),
          child: Row( children: [
            Avatar(
                size: 60,
                ImageURL:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReSQp9MqQWLBsNJQ0C9OA4uSKKkqlI6-hUog&usqp=CAU"),
            SizedBox(width: 10,),
            Container(
              child: Column(
                children: [
                  Align( alignment: Alignment.centerLeft,
                    child: Container(
                      width: 150,
                      child: CText( text:"Follow Request", fontSize: 17, fontWeight: FontWeight.w600,),
                    ),
                  ),
                  SizedBox(height: 3,),
                  CText( text:"Approve or ignore request", fontSize: 13,),
                ],
              ),
            ),
          ]),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, top: 5,bottom: 10),
          child: Align(
              alignment: Alignment.centerLeft,
              child: CText( text:"Today", fontSize: 17, fontWeight: FontWeight.w600,)
          ),
        ),
        Container(
          child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: today.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: NotificationItems(
                      notification: today[index], time: time[index]),
                );
              }),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, top: 15, bottom: 10 ),
          child: Align(alignment: Alignment.centerLeft,
              child: CText(text:"Yesterday", fontSize: 17, fontWeight: FontWeight.w600,)
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: yesterday.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: NotificationItems(
                notification: yesterday[index],
                time: time[index],
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, top: 15, bottom: 10),
          child: Align(alignment: Alignment.centerLeft,
              child: CText(text:"This Month", fontSize: 17, fontWeight: FontWeight.w600,)
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: thisMonth.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: NotificationItems(
                  notification: thisMonth[index],
                  time: time[index],
                ),
              );
            })
      ],
    );
  }
}
