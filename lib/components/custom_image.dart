import 'package:flutter/material.dart';
import 'package:pluto/config/config.dart' as CONFIG;

class Custom_Image extends StatelessWidget {
  String imageUrl;

   Custom_Image({Key? key, required this.imageUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.red,
      ),
      child: Image.network(imageUrl),
    );
  }
}
