import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationAlert extends StatefulWidget {
  @override
  State<NotificationAlert> createState() => _NotificationAlertState();
}

class _NotificationAlertState extends State<NotificationAlert> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Stack(
        children: [
          Icon(
            FontAwesomeIcons.bell,
            color: Colors.grey,
            size: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 15, bottom: 17),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Text("1"),
          )
        ],
      ),
    );
  }
}
