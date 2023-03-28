import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pluto/components/post.dart';
import 'package:pluto/screens/notification.dart';

import '../screens/home.dart';
import 'package:pluto/config/config.dart' as CONFIG;

class BottomMenu extends StatelessWidget {
  String active;
  BottomMenu({this.active = "home"});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
          boxShadow: [BoxShadow(color:Colors.grey[200]!,blurRadius: 6,spreadRadius:3)]
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home())),
              child: Container(
                width: 30,
                height: 30,
                padding: EdgeInsets.only(bottom: 2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: active == "home"
                        ? CONFIG.secondaryColor
                        : Colors.white),
                child: Icon(
                  FontAwesomeIcons.house,
                  size: 18,
                  color:
                      active == "home" ? Colors.white: CONFIG.secondaryColor,
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.push,
              child: Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: active == "Market place"
                        ? CONFIG.secondaryColor
                        : Colors.white),
                child: Icon(
                  FontAwesomeIcons.locationDot,
                  size: 18,
                  color:
                      active == "Market place" ? Colors.white: CONFIG.secondaryColor,
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.push,
              child: Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: active == "add post"
                        ? CONFIG.secondaryColor
                        : Colors.white),
                child: Icon(
                  FontAwesomeIcons.add,
                  size: 18,
                  color: active == "add post"
                      ? Colors.black
                      : CONFIG.secondaryColor,
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.push,
              child: Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: active == "Information"
                        ? CONFIG.secondaryColor
                        : Colors.white),
                child: Icon(
                  FontAwesomeIcons.circleInfo,
                  size: 18,
                  color: active == "Information"
                      ? Colors.white
                      : CONFIG.secondaryColor,
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.push,
              child: Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: active == "Notification"
                        ? CONFIG.secondaryColor
                        : Colors.white),
                child: Icon(
                  FontAwesomeIcons.bell,
                  size: 18,
                  color: active == "Notification"
                      ? Colors.white
                      : CONFIG.secondaryColor,
                ),
              ),
            ),
          ]),
    );
  }
}
