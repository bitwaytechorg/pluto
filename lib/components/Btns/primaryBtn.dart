import 'package:flutter/material.dart';
import 'package:pluto/config/config.dart' as CONFIG;

class PrimaryBtn extends StatelessWidget {
  String ButtonTitle;
  double width;
  double height;
  PrimaryBtn({Key? key, required this.ButtonTitle, this.width=200, this.height=50});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: CONFIG.primaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Center(
          child: Text(ButtonTitle, style: TextStyle(
            color: Colors.white,
          ),),
        ),
      ),
    );
  }
}
