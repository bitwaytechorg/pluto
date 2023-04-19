import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pluto/components/slider_menu.dart';
import 'package:pluto/config/config.dart' as CONFIG;
import 'package:pluto/global/session.dart' as SESSION;
import '../components/avatar.dart';
import '../components/cText.dart';
import '../components/scroll_behaviour.dart';
import '../components/topbar.dart';

class ChangePassword extends StatefulWidget {
  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;

  void toggleMenu() {
    bool tmpStatus = !isDrawerOpen;
    setState(() {
      xOffset = tmpStatus ? 250 : 0;
      yOffset = tmpStatus ? 50 : 0;
      scaleFactor = tmpStatus ? 0.91 : 1;
      isDrawerOpen = tmpStatus;
    });
  }

  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  String message = "";
  bool updating = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: false,
        extendBody: false,
        body: SafeArea(
          top: true,
          bottom: true,
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: Stack(children: [
              //drawer go here
              Slider_menu(),
              // page content go here
              AnimatedContainer(
                  width: MediaQuery.of(context).size.width,
                  //height: MediaQuery.of(context).size.height,
                  transform: Matrix4.translationValues(xOffset, yOffset, 0)
                    ..scale(scaleFactor)
                    ..rotateY(isDrawerOpen ? -0.5 : 0),
                  duration: Duration(milliseconds: 250),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius:
                      BorderRadius.circular(isDrawerOpen ? 40 : 0.0)),
                  child: Column(children: [
                    Container(
                        color:CONFIG.secondaryColor,
                        child:TopBar(
                            isDrawerOpen: isDrawerOpen,
                            onTap: toggleMenu,
                            isMainPage: false,
                            isPrimaryBack: true,
                            secondaryWidget: Container())),
                    Stack(
                      children: [
                        Container(
                          height: 80,
                          color: CONFIG.secondaryColor,
                        ),
                        //Content
                        buildContentBlock(),
                      ],
                    ),
                  ])),
            ]),
          ),
        ));
  }

  Widget buildContentBlock() {
    return SingleChildScrollView(
      reverse: false,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(
              child: Column(
                children: [
                  Avatar(size: 100, ImageURL: SESSION.profileUrl),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Hello "+SESSION.firstName,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: CONFIG.primaryColor),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Divider( color: CONFIG.primaryColor,),
                Padding(
                  padding: const EdgeInsets.only(top: 10 , bottom: 10),
                  child: CText(text:"Update Your Password",
                   fontSize: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, top: 15,),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: CText(text:
                      "Old password",
                      fontSize: 15,
                    ),
                  ),
                ),
                TextFormField(
                  controller: oldPassword,
                  obscureText: true,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, top: 15, bottom: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: CText(text:
                      "New password",
                      fontSize: 15,
                    ),
                  ),
                ),
                TextFormField(
                  controller: newPassword,
                  obscureText: true,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, top: 15, bottom: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: CText(text:
                      "Confirm password",
                      fontSize: 15,
                    ),
                  ),
                ),
                TextFormField(
                  controller: confirmPassword,
                  obscureText: true,
                ),
                SizedBox(height:35),

                Container(
                  width: 200,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () async {
                      if(newPassword.text==confirmPassword.text){
                        setState(() {
                          updating= true;
                          message="Please wait while we update your password...";
                        });
                        final user = await FirebaseAuth.instance.currentUser;
                        final cred = EmailAuthProvider.credential(
                            email: SESSION.email, password: oldPassword.text);
                        user?.reauthenticateWithCredential(cred).then((value) {
                          user.updatePassword(newPassword.text).then((_) {
                            oldPassword.text="";
                            newPassword.text="";
                            confirmPassword.text="";
                            setState(() {
                              updating = false;
                              message="Password Updated Successfully!";
                            });
                          }).catchError((error) {
                            //Error, show something
                            setState(() {
                              updating = false;
                              message="Error - "+error;
                            });
                          });
                        }).catchError((err) {
                          setState(() {
                            updating = false;
                            message="Error - "+err;
                          });
                        });
                      } else {
                        setState(() {
                          message="Please confirm your new password.";
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CONFIG.primaryColor.withAlpha(200),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                    child: updating?CircularProgressIndicator(color: Colors.white,):Text("Update Password",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(message),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

}

