import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WebHome extends StatefulWidget{

  @override
  WebHomeState createState()=> WebHomeState();
}

class WebHomeState extends State<WebHome>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Text("Web Home Page"),),
    );
  }

}