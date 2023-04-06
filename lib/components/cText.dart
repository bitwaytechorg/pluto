import 'package:flutter/material.dart';
import 'package:pluto/config/config.dart' as CONFIG;

class CText extends StatelessWidget {
  String text;
  Color  color;
  double fontSize;
  FontWeight fontWeight;
  int maxLines;

  CText({Key? key, required this.text, this.color= Colors.black54, this.fontSize=20, this.fontWeight= FontWeight.normal, this.maxLines=1 });

  @override
  Widget build(BuildContext context) {
    return Text( text, style: TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    ),
     softWrap: true,
      overflow: TextOverflow.ellipsis ,
      maxLines: maxLines,
    );
  }
}
