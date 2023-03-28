import 'package:flutter/material.dart';
import 'package:pluto/config/config.dart' as CONFIG;

class SecondaryBtn extends StatelessWidget {
   String buttonTitle;
   SecondaryBtn({Key? key, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey.withAlpha(40),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric( vertical: 10),
          child: Text(buttonTitle, style: TextStyle(
            color: CONFIG.primaryColor,
          ),),
        ),
      ),
    );
  }
}
