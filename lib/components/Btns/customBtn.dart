import 'package:flutter/material.dart';
import 'package:pluto/config/config.dart' as CONFIG;

class CustomBtn extends StatelessWidget {
  String buttonTitle;
  Color color;
  double height;
  double width;
  double borderRadius;

  CustomBtn({Key? key, required this.buttonTitle, this.color= Colors.white, this.height=50, this.width=110, this.borderRadius=40 });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: color,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric( vertical: 10),
          child: Text(buttonTitle, style: TextStyle(
            color: Colors.white,
          ),),
        ),
      ),
    );
  }
}
