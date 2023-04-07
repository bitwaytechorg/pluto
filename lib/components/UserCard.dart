import 'package:flutter/material.dart';
import 'package:pluto/config/config.dart' as CONFIG;

import 'avatar.dart';
import 'cText.dart';

class UserCard extends StatefulWidget {
  String name;
  int services;
  String location;
  String profileURL;
   UserCard({Key? key, required this.name, required this.services, required this.location, this.profileURL=''}) : super(key: key);

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
        border: Border.all( width: 0.3, color: CONFIG.primaryColor),
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Avatar(size: 80, ImageURL:widget.profileURL),
          SizedBox(height: 10,),
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
          SizedBox(height: 5,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on,size: 18, color: CONFIG.secondaryColor,),
              CText(text:widget.location, fontSize: 15, maxLines: 2,)
            ],
          )
        ],
      ),
    );
  }
}
