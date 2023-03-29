import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pluto/components/avatar.dart';

class Mobile_UserProfile extends StatefulWidget{

  @override
  Mobile_UserProfileState createState()=> Mobile_UserProfileState();
}

class Mobile_UserProfileState extends State<Mobile_UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Container(
          child: Column(
              children: [
                Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Avatar(
                            size: 80, ImageURL: ' ',),
                      )
                    ]
                ),
              ]
          ),
        ),
      ),
    );
  }
}