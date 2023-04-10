import 'package:flutter/material.dart';
import 'package:pluto/config/config.dart' as CONFIG;

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
      height: 260,
      width: 150,
      decoration: BoxDecoration(
        border: Border.all( width: 0.3, color: CONFIG.primaryColor),
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Text("pet card"),
    );
  }
}
