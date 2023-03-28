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
      height: 70,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      decoration: BoxDecoration(),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home())),
              child: Container(
                width: 40,
                height: 40,
                padding: EdgeInsets.only(bottom: 2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: active == "home"
                        ? CONFIG.secondaryColor
                        : Colors.white),
                child: Icon(
                  FontAwesomeIcons.house,
                  size: 20,
                  color:
                      active == "home" ? Colors.black : CONFIG.secondaryColor,
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.push,
              child: Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: active == "Market place"
                        ? CONFIG.secondaryColor
                        : Colors.white),
                child: Icon(
                  FontAwesomeIcons.search,
                  size: 20,
                  color:
                      active == "Market place" ? Colors.black : CONFIG.secondaryColor,
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.push,
              child: Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: active == "add post"
                        ? CONFIG.secondaryColor
                        : Colors.white),
                child: Icon(
                  FontAwesomeIcons.add,
                  size: 20,
                  color: active == "add post"
                      ? Colors.black
                      : CONFIG.secondaryColor,
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.push,
              child: Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: active == "Information"
                        ? CONFIG.secondaryColor
                        : Colors.white),
                child: Icon(
                  FontAwesomeIcons.user,
                  size: 20,
                  color: active == "Information"
                      ? Colors.black
                      : CONFIG.secondaryColor,
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.push,
              child: Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: active == "Notification"
                        ? CONFIG.secondaryColor
                        : Colors.white),
                child: Icon(
                  FontAwesomeIcons.bell,
                  size: 20,
                  color: active == "Notification"
                      ? Colors.black
                      : CONFIG.secondaryColor,
                ),
              ),
            ),
          ]),
    );
  }
}
