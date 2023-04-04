import 'package:flutter/material.dart';

import 'avatar.dart';
import 'notification.dart';

class NotificationItems extends StatefulWidget {
  String notification;
  String time;
   NotificationItems({Key? key, required this.notification, required this.time,}) : super(key: key);

  @override
  State<NotificationItems> createState() => _NotificationItemsState();
}

class _NotificationItemsState extends State<NotificationItems> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(child: Column(
        children: [
          Container(
            height: 50,
            child: Row(
              children: [
                Padding(
                  padding:EdgeInsets.only(top: 5, left: 15),
                  child: Avatar(size: 40, ImageURL: ""),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 15, ),
                    child: Text( widget.notification)),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Text(widget.time),
                ),
              ],
            ),
          ),
        ],
      ),),
    );
  }
}
