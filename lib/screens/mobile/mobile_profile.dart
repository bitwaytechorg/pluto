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
                       Padding(
                         padding: const EdgeInsets.all(10),
                         child: Avatar(size: 80, ImageURL: 'assets/images/bird.jpg'),
                       ),
                       Column(
                         children: [
                           SizedBox(height: 20,),
                           Row(
                             children: [
                               Column(
                                 children: [
                                   Text("200K", style: TextStyle(
                                     fontWeight: FontWeight.w500,
                                   ),),
                                   SizedBox(height:5),
                                   Text('Friends', style: TextStyle(
                                     color: Colors.grey,
                                     fontSize: 12,
                                   ),)
                                 ],
                               ),
                               Padding(
                                 padding: const EdgeInsets.symmetric(horizontal: 25),
                                 child: Column(
                                   children: [
                                     Text("200K", style: TextStyle(
                                       fontWeight: FontWeight.w500,
                                     ),),
                                     SizedBox(height:5),
                                     Text('Followers', style: TextStyle(
                                       color: Colors.grey,
                                       fontSize: 12,
                                     ),)
                                   ],
                                 ),
                               ),
                               Column(
                                 children: [
                                   Text("200K", style: TextStyle(
                                     fontWeight: FontWeight.w500,
                                   ),),
                                   SizedBox(height:5),
                                   Text('Following', style: TextStyle(
                                     color: Colors.grey,
                                     fontSize: 12,
                                   ),)
                                 ],
                               )
                             ],
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 8, right: 8, top: 15),
                             child: Row(
                               children: [
                                 SecondaryBtn(buttonTitle:"Follow"),
                                 SizedBox(width: 10,),
                                 SecondaryBtn(buttonTitle: "Message")
                               ],
                             ),
                           )
                         ],
                       )
                     ],
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 15, top: 10),
                     child: Align(
                       alignment: Alignment.centerLeft,
                         child: Text("Dileep Kumar",
                         style: TextStyle(
                           fontWeight: FontWeight.w600,
                           fontSize: 20,
                         ),),
                     ),
                   ),

                   Padding(
                     padding: const EdgeInsets.only(left: 10, top:10),
                     child: RichText(
                       text: TextSpan(
                         style: TextStyle(color: Colors.black, fontSize: 16),
                         children: <TextSpan>[
                           TextSpan(text: 'flutter developer ', style: TextStyle(color: Colors.blue)),
                           TextSpan(text: 'wordpress developer'),
                           TextSpan(text: ' web developer', style: TextStyle(decoration: TextDecoration.underline))
                         ],
                       ),
                     ),
                   ),
                 //GridView.builder(gridDelegate: gridDelegate, itemBuilder: itemBuilder)
                 ],
               ),
             ),
           ),
    );
  }

}