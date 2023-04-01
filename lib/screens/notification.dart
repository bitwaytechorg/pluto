import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {

  @override
  State<NotificationPage> createState() => _NotificationPageState();

}

class _NotificationPageState extends State<NotificationPage> {
  List notifications = [
    "t is used to develop applications ",
    "method of creating applications",
    "t is used to develop applications ",
    "method of creating applications",
    "t is used to develop applications ",
    "method of creating applications",
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Text(notifications[index]),
        );
      },

    );
  }
}
