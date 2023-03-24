import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:mrs_jacked_app/components/auth_builder.dart';

import '../home.dart';


class SMSVerify extends StatelessWidget {
  final dynamic flowKey;
  final dynamic action;
  final dynamic phone;

  SMSVerify({ required this.flowKey, required this.action, required this.phone});
  @override
  Widget build(BuildContext context) {
    return SMSCodeInputScreen(
      actions: [
        AuthStateChangeAction((context, state) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
        })
      ],
      flowKey: flowKey,
      action: action,
      // headerBuilder: headerBuilder(),
      // sideBuilder: sideBuilder(),
    );
  }
}
