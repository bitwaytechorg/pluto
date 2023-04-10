import 'package:flutter/material.dart';
import 'package:pluto/components/avatar.dart';
import 'package:pluto/config/config.dart' as CONFIG;

import 'cText.dart';

class PetCard extends StatefulWidget {
  const PetCard({Key? key}) : super(key: key);

  @override
  State<PetCard> createState() => _PetCardState();
}

class _PetCardState extends State<PetCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 210,
      width: 150,
      decoration: BoxDecoration(
        border: Border.all( width: 0.3, color: CONFIG.primaryColor),
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Avatar( size: 80, ImageURL:'https://www.akc.org/wp-content/uploads/2017/11/German-Shepherd-on-White-00.jpg',),
        ),
        Row(children: [
          SizedBox(width: 7,),
          CText(text: 'Dog: ', fontSize: 15, fontWeight: FontWeight.bold, color: CONFIG.primaryColor,),
          CText(text: 'Dog name', fontSize: 14, fontWeight: FontWeight.bold, color: CONFIG.primaryColor,),
        ],),
        Padding(
          padding: const EdgeInsets.only(left: 7, right: 7, top: 5),
          child: CText(text: "Starting out with a low-maintenance pet gives an owner the opportunity to learn more about the requirements of their care. Once an owner gains more confidence,",
            fontSize: 13, maxLines: 3,),
        ),
        SizedBox(height: 15,),
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Align(
              alignment: Alignment.centerRight,
              child: CText(text: "More...", fontSize: 17, color: CONFIG.primaryColor,)),
        ),
      ],),
    );
  }
}
