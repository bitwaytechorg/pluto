import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pluto/components/Btns/primaryBtn.dart';
import 'package:pluto/components/Btns/secondaryBtn.dart';
import 'package:pluto/config/config.dart' as CONFIG;
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
                         child: Avatar(size: 80, ImageURL: '/assets/images/bird.jpg'),
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
                     padding: const EdgeInsets.only(left: 15, top: 18),
                     child: Align(
                       alignment: Alignment.centerLeft,
                         child: Text("Dileep Kumar",
                         style: TextStyle(
                           fontWeight: FontWeight.w500,
                           fontSize: 20,
                         ),),
                     ),
                   ),

                   Padding(
                     padding: const EdgeInsets.only(left: 10, top:10),
                     child: RichText(
                       text: TextSpan(
                         style: TextStyle(color: Colors.black.withAlpha(120), fontSize: 15),
                         children: <TextSpan>[
                           TextSpan(text: 'flutter developer ', style: TextStyle(color: Colors.blue)),
                           TextSpan(text: 'wordpress developer'),
                           TextSpan(text: ' web developer', style: TextStyle(decoration: TextDecoration.underline))
                         ],
                       ),
                     ),
                   ),

              GridView.count(
                shrinkWrap: true,
               crossAxisCount: 4,
                 crossAxisSpacing: 4.0,
                 mainAxisSpacing: 8.0,
                 children: List.generate(4, (index) {
                 return Center(
                  child: Container(
                     height: 30,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        border: Border.all(width: 1, color: CONFIG.primaryColor.withAlpha(100)),

                      ),
                      child:Center(child: Text("chips")))

                     );
                  }
                 )
              ),


                 Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 15),
                     child: Row(
                       children: [
                         PrimaryBtn(ButtonTitle: 'Connect', width: 260,height: 45,),
                         SizedBox(width: 15,),
                         Container(
                           height: 42,
                           width: 42,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.all(Radius.circular(40)),
                             border: Border.all(width: 1, color: CONFIG.primaryColor.withAlpha(100)),

                           ),
                           child: Icon(Icons.more_horiz, color: CONFIG.primaryColor, size: 20,)
                         )
                       ],
                     ),
                   ),


                  Divider(endIndent: 5, indent: 5,),


                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Row(
                           children: [
                             Row(
                               children: [
                                Icon(Icons.table_chart_outlined),
                                 SizedBox(width: 5,),
                                 Text("Activity")
                               ],
                             ),
                             SizedBox(width: 20,),
                             Row(
                               children: [
                                Icon(Icons.account_box_outlined),
                                 SizedBox(width: 5,),
                                 Text("About")
                               ],
                             ),
                           ],
                         ),
                         Icon(CupertinoIcons.slider_horizontal_3),
                       ],
                     ),
                   ),
                   Divider(thickness: 4, endIndent: 5, indent: 5,),
                 ],
               ),
             ),
           ),
    );
  }

}