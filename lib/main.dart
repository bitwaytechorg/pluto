import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart'
    hide PhoneAuthProvider, EmailAuthProvider;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pluto/screens/auth/forget_password.dart';
import 'package:pluto/screens/auth/phone.dart';
import 'package:pluto/global/session.dart' as SESSION;
import 'package:pluto/screens/auth/verify_email.dart';
import 'package:pluto/screens/home.dart';
import 'package:pluto/screens/splash.dart';
import 'components/auth_builder.dart';
import 'config/firebase_config.dart';
import 'config/firebase_configration.dart';
import 'config/firebase_remote_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseConfig.platformOptions);
  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
    PhoneAuthProvider(),
    //GoogleProvider(clientId: ),
  ]);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MaterialApp(
            title: "Pluto",
            // theme: lightTheme,
            // darkTheme: darkTheme,
            home: FutureBuilder<FirebaseRemoteConfig>(
              future: setupRemoteConfig(),
              builder: (BuildContext context,
                  AsyncSnapshot<FirebaseRemoteConfig> snapshot) {
                return snapshot.hasData
                    ? AuthGate(remoteConfig: snapshot.requireData)
                    : Splash();
              },
            ),
            debugShowCheckedModeBanner: false,
            locale: const Locale('en', 'AU'),
            supportedLocales: const [Locale('en', 'AU')],
            localizationsDelegates: [
              // FirebaseUILocalizations.withDefaultOverrides(const LabelOverrides()),
              // GlobalMaterialLocalizations.delegate,
              // GlobalWidgetsLocalizations.delegate,
              // GlobalCupertinoLocalizations.delegate,
              // FirebaseUILocalizations.delegate,
            ],
          )));
}

class AuthGate extends AnimatedWidget {
  AuthGate({
    required this.remoteConfig,
  }) : super(listenable: remoteConfig);

  final FirebaseRemoteConfig remoteConfig;
  Map<String, dynamic> userData = {};

  @override
  Widget build(BuildContext context) {
    final mfaAction = AuthStateChangeAction<MFARequired>(
      (context, state) async {
        print("IN FUN");
        await startMFAVerification(
          context: context,
          resolver: state.resolver,
        );
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
      },
    );
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        // if user is already signed-in use it as initial data

        initialData: FirebaseAuth.instance.currentUser,
        builder: (context, snapshot) {
          // waiting for data
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Splash();
          } else {
            // user not signed in
            if (snapshot.data == null) {
              return SignInScreen(
                actions: [
                  ForgotPasswordAction((context, email) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ForgetPassword(email: email)));
                  }),
                  VerifyPhoneAction((context, _) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => PhoneLogin()));
                  }),
                  AuthStateChangeAction<SignedIn>((context, state) async {
                    //set session
                    print("login done");

                    if (!state.user!.emailVerified) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VerifyEmail()));
                    } else {
                      await setSession(state.user!.uid);
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    }
                  }),
                  AuthStateChangeAction<UserCreated>((context, state) {
                    FirebaseFirestore.instance
                        .collection("users")
                        .doc(state.credential.user!.uid)
                        .set({
                      "uid": state.credential.user!.uid,
                    });
                    if (!state.credential.user!.emailVerified) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VerifyEmail()));
                    } else {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    }
                  }),
                  mfaAction,
                  EmailLinkSignInAction((context) {
                    Navigator.pushReplacementNamed(
                        context, '/email-link-sign-in');
                  }),
                ],
                styles: const {
                  EmailFormStyle(signInButtonVariant: ButtonVariant.filled),
                },
                headerBuilder: headerBuilder(),
                sideBuilder: sideBuilder(),
                subtitleBuilder: (context, action) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text(
                      action == AuthAction.signIn
                          ? 'Welcome to Pluto! Please sign in to continue.'
                          : 'Welcome to Pluto! please create a account to continue',
                    ),
                  );
                },
                footerBuilder: (context, action) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text(
                        action == AuthAction.signIn
                            ? 'Welcome to Pluto! please sign in to continue.'
                            : 'Welcome to Pluto ! please create an account to continue',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  );
                },
              );
            } else {
              //Render Your applicatiom if authenticated
              //and local session
              return FutureBuilder<bool>(
                future: setSession(
                    FirebaseAuth.instance.currentUser!.uid), // async work
                builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Splash();
                    default:
                      if (snapshot.hasError) {
                        print("ERROR");
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else {
                        return Home();
                      }
                  }
                },
              );
            }
          }
        },
      ),
    );
  }

  Future<bool> setSession(String uid) async {
    //print(uid);
    var result =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();
    userData = result.data() as Map<String, dynamic>;
    //print("set user data");
    // print(userData["subscription_started"]);
    SESSION.uid = uid;
    SESSION.email = userData.containsKey("email")
        ? userData['email']
        : FirebaseAuth.instance.currentUser!.email;
    SESSION.dob = userData["dob"] ?? "";
    SESSION.firstName = userData["firstName"] ?? "";
    SESSION.lastName = userData["lastName"] ?? "";
    SESSION.phoneNumber = userData["phoneNumber"] ?? "";
    SESSION.age = userData['age'] ?? 0;
    SESSION.gender = userData["gender"] ?? "";

    return true;
  }
}
