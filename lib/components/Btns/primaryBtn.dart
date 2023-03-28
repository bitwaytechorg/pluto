import 'package:flutter/material.dart';

class PrimaryBtn extends StatelessWidget {
  String ButtonTitle;
  PrimaryBtn({Key? key, required this.ButtonTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.blue,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        child: Text(ButtonTitle, style: TextStyle(
          color: Colors.white,
        ),),
      ),
    );
  }
}
