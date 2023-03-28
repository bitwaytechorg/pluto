import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pluto/components/Btns/secondaryBtn.dart';
import 'package:pluto/components/avatar.dart';

class Mobile_Profile extends StatefulWidget{

  @override
  Mobile_ProfileState createState()=> Mobile_ProfileState();
}

class Mobile_ProfileState extends State<Mobile_Profile>{
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
                       Avatar(size: 80, ImageURL: 'assets/images/bird.jpg'),
                       Column(
                         children: [
                           Row(
                             children: [
                               Column(
                                 children: [
                                   Text("200K"),
                                   Text('Connections')
                                 ],
                               ),
                               Column(
                                 children: [
                                   Text("200K"),
                                   Text('Connections')
                                 ],
                               ),
                               Column(
                                 children: [
                                   Text("200K"),
                                   Text('Connections')
                                 ],
                               )
                             ],
                           ),
                           Row(
                             children: [
                               SecondaryBtn(buttonTitle:"Follow"),
                               SecondaryBtn(buttonTitle: "Message")
                             ],
                           )
                         ],
                       )
                     ],
                   )
                 ],
               ),
             ),
           ),
    );
  }

}