import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';


SideBuilder sideBuilder(){
  return (context, constraints){
    return Container(
      color: Colors.blue,
      padding: EdgeInsets.all(50),
      child: AspectRatio(
        aspectRatio: 1,
        child: Center(
          child: Image.asset("assets/images/logo.png"),
        ),
      ),
    );
  };
}
HeaderBuilder headerBuilder(){
  return (context, constraints, _){
    return Container(
      color: Colors.cyanAccent,
      padding: EdgeInsets.all(20),
      child:  AspectRatio(
        aspectRatio: 1,
        child:  Center(
          child: Image.asset("assets/images/logo.png", width: MediaQuery.of(context).size.width-180,),
        ),
      ),
    );
  };
}