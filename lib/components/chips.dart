import 'package:flutter/material.dart';
import 'package:pluto/config/config.dart' as CONFIG;

class Chips extends StatelessWidget {
  String chipTitle;
  Chips({Key? key, required this.chipTitle});

  @override
  Widget build(BuildContext context) {
     return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey.withAlpha(40),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
          child: Text(chipTitle, style: TextStyle(
            color: CONFIG.primaryColor,
          ),),
        ),
      ),
    );
  }
}



