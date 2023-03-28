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
                child: Icon(
                  FontAwesomeIcons.house,
                  size: 18,
                  color:
                      active == "home" ? CONFIG.primaryColor:Colors.grey[400],
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.push,
              child: Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                child: Icon(
                  FontAwesomeIcons.shop,
                  size: 18,
                  color:
                      active == "Market place" ? CONFIG.primaryColor: Colors.grey[400],
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.push,
              child: Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                child: Icon(
                  FontAwesomeIcons.squarePlus,
                  size: 25,
                  color: active == "add post"
                      ? CONFIG.primaryColor:Colors.grey[400],
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.push,
              child: Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                child: Icon(
                  FontAwesomeIcons.bookOpenReader,
                  size: 18,
                  color: active == "Information"
                      ? CONFIG.primaryColor: Colors.grey[400],
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.push,
              child: Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                child: Icon(
                  FontAwesomeIcons.dog,
                  size: 18,
                  color: active == "Pet finder"
                      ? CONFIG.primaryColor: Colors.grey[400],
                ),
              ),
            ),
          ]),
    );
  }
}
