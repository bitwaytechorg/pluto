import 'package:flutter/material.dart';
import 'package:pluto/config/config.dart' as CONFIG;

class SecondaryBtn extends StatelessWidget {
   String buttonTitle;
   SecondaryBtn({Key? key, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey.withAlpha(40),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Text(buttonTitle, style: TextStyle(
          color: CONFIG.primaryColor,
        ),),
      ),
    );
  }
}
