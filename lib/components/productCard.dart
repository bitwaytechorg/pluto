import 'package:flutter/material.dart';
import 'package:pluto/config/config.dart' as CONFIG;

import 'avatar.dart';

class UserCard extends StatefulWidget {
  String name;
  int services;
  String location;
  UserCard({Key? key, required this.name, required this.services, required this.location}) : super(key: key);

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 260,
      width: 150,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: CONFIG.primaryColor),
        color: CONFIG.secondaryColor.withAlpha(20),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Avatar(size: 60, ImageURL: ''),
          SizedBox(height: 5,),
          Text(widget.name, style: TextStyle(
            fontSize: 16, color: CONFIG.primaryColor,
          )),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.home_repair_service,size: 18, color: CONFIG.secondaryColor,),
              SizedBox(width: 3,),
              Text("Services: ${widget.services}", style: TextStyle(
                fontSize: 15,
              )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on,size: 18, color: CONFIG.secondaryColor,),
              Text(widget.location, style: TextStyle(), softWrap: true, maxLines: 2,)
            ],
          )
        ],
      ),
    );
  }
}
