import 'package:flutter/material.dart';
import 'package:pluto/config/config.dart' as CONFIG;

class BorderedBtn extends StatelessWidget {
  String buttonTitle;
  BorderedBtn({Key? key, required this.buttonTitle }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(width: 1.3, color: CONFIG.primaryColor),
        color: Colors.white,
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
