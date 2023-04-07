import 'package:flutter/material.dart';

import 'avatar.dart';
import 'cText.dart';
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
      padding: const EdgeInsets.only(left: 8),
      child: Container(child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 0.1)),
              color: Colors.grey.withAlpha(10)
            ),
            height: 60,
            child: Row(
              children: [
                Padding(
                  padding:EdgeInsets.only(top: 5, left: 15),
                  child: Avatar(size: 40, ImageURL: ""),
                ),
                Container(
                  width: MediaQuery.of(context).size.width-110,
                    padding:EdgeInsets.only(top: 5, left: 15),
                    child: CText( text:widget.notification, fontSize: 15, maxLines: 2,)),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child:CText( text:widget.time, fontSize: 13,),
                ),
              ],
            ),
          ),
        ],
      ),),
    );
  }
}
