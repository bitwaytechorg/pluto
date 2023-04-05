import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/avatar.dart';
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
    "It is used to develop applications",
    "It is used to develop applications",
    "It is used to develop applications",
    "It is used to develop applications",
  ];

  List yesterday = [
    "new massage",
    "It is used to develop applications",
    "It is used to develop applications",
    "It is used to develop applications",
    "It is used to develop applications",
  ];

  List thisMonth = [
    "new massage",
    "It is used to develop applications",
    "It is used to develop applications",
    "It is used to develop applications",
    "It is used to develop applications",
  ];

  List Notification = [
    "It is used to develop applications",
    "It is used to develop applications",
    "It is used to develop applications",
    "It is used to develop applications",
    "It is used to develop applications",
    "It is used to develop applications",
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
                            "NotificationPages",
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
                child: SingleChildScrollView(

                    physics: ScrollPhysics(), child: buildContent()),
              )
            ],
          ),
        ),
      ),
    );
  }

  buildContent() {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Avatar(
                  size: 80,
                  ImageURL:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReSQp9MqQWLBsNJQ0C9OA4uSKKkqlI6-hUog&usqp=CAU"),
            ),
          ),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 200, bottom: 5),
                  child: Text(
                    "Follow Request",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 145,
                  ),
                  child: Text(
                    "Approve or ignore request",
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
        ]),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 5, bottom: 5),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Today",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
        ),
        Container(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: today.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: NotificationItems(
                      notification: Notification[index], time: time[index]),
                );
              }),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 5, bottom: 5),
          child: Align(alignment: Alignment.centerLeft, child: Text("Yesterday", style: TextStyle(fontWeight: FontWeight.bold))),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: yesterday.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: NotificationItems(
                notification: Notification[index],
                time: time[index],
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 5, bottom: 5),
          child: Align(alignment: Alignment.centerLeft, child: Text("This Month",style: TextStyle(fontWeight: FontWeight.bold))),
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: thisMonth.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: NotificationItems(
                  notification: Notification[index],
                  time: time[index],
                ),
              );
            })
      ],
    );
  }
}
