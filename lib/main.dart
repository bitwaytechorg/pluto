import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'config/firebase_config.dart';
import 'config/firebase_configration.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseConfig.platformOptions);
  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
    PhoneAuthProvider(),
  ]);

  runApp(MyApp());

}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
           body: SafeArea(
             top: true,
               child: const Placeholder(child: Text("This is Home page"),)),
         )
    );
  }
}



