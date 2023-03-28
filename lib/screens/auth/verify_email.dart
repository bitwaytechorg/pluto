import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/auth_builder.dart';
import '../home.dart';

class VerifyEmail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return EmailVerificationScreen(
      headerBuilder: headerBuilder(),
      sideBuilder: sideBuilder(),
      // actionCodeSettings: GLOBAL.actionCodeSettings,
      actions: [
        EmailVerifiedAction(() {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
        }),
        AuthCancelledAction((context) {
          // FirebaseUIAuth.signOut(context: context);
          // Navigator.pushReplacementNamed(context, '/');
          Navigator.pop(context);

        }),
      ],
    );
  }
}
