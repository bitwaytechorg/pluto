import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pluto/config/config.dart' as CONFIG;
import 'package:pluto/screens/business_profile.dart';
import 'package:pluto/screens/change_password.dart';
import 'package:pluto/screens/home.dart';
import 'package:pluto/screens/leader_board.dart';
import 'package:pluto/screens/mobile/mobile_leaderboard.dart';
import 'package:pluto/screens/user_profile.dart';
import 'package:pluto/global/session.dart' as SESSION;
import '../screens/setting.dart';
import '../screens/test_page.dart';
import 'avatar.dart';

class Slider_menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: CONFIG.primaryColor,
      padding: EdgeInsets.only(top: 70),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///circle Avatar
            InkWell(
              onTap: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => User_Profile())),
              child: Container(
                width: 250,
                height: 100,
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: 20),
                child: Avatar( size: 100, ImageURL: SESSION.profileUrl,
                ),
              ),
            ),
            SizedBox(height: 10,),


            ///Profile

            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                child: InkWell(
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => User_Profile())),
                  },
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.user,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'See Profile',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                child: InkWell(
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Home())),
                  },
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.house,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Home',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                child: InkWell(
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Leaderboard())),
                  },
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.chartLine,
                        color: Colors.white,
                        size: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'LeaderBoard',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            // Container(
            //   margin: EdgeInsets.only(left: 70, top: 15),
            //   child: Text("Edit Profile ",
            //       style: TextStyle(color: Colors.white, fontSize: 18)),
            // ),
            //  InkWell(
            // onTap: () => Navigator.pushReplacement(context,
            //       MaterialPageRoute(builder: (context) => User_Profile())),
            //   child: Padding(
            //     padding: EdgeInsets.only(
            //       left: 20,
            //       top: 20,
            //     ),
            //     child: Container(
            //       height: 40,
            //       width: 200,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(5),
            //         color: Colors.greenAccent.withAlpha(100),
            //       ),
            //       child: Padding(
            //         padding: const EdgeInsets.symmetric(
            //             horizontal: 20, vertical: 10),
            //         child: Center(
            //           child: Text(
            //             "See Profile",
            //             style: TextStyle(
            //               color: Colors.white,
            //             ),
            //           ),
            //         ),
            //       ),
            //
            //     ),
            //   ),
            // ),
            // Container(
            //   height: 40,
            //   width: 200,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(5),
            //     color: Colors.greenAccent.withAlpha(100),
            //   ),
            //   margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            //   child: InkWell(
            //     onTap: (){
            //       Navigator.pushReplacement(context,
            //           MaterialPageRoute(builder: (context) => Mobile_Leaderboard()));
            //     },
            //       child: Center(child: Text("LEADERBOARD", style: TextStyle(color: Colors.white),))
            //   ),
            // ),
            // Container(
            //   height: 40,
            //   width: 200,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(5),
            //     color: Colors.greenAccent.withAlpha(100),
            //   ),
            //   margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            //   child: InkWell(
            //       onTap: (){
            //         Navigator.pushReplacement(context,
            //             MaterialPageRoute(builder: (context) => Home()));
            //       },
            //       child: Center(child: Text("Home", style: TextStyle(color: Colors.white),))
            //   ),
            // ),

            ///menu items
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 5),
                    width: 250,
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Color(0xCCFFFFFF))),
                    ),
                    child: Text('Account',
                        style: TextStyle(color: Colors.white)),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: InkWell(
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Business_Profile())),
                      },
                      child: Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.addressCard,
                            color: Colors.white,
                            size: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Business Profile',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: InkWell(
                      onTap: () => {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings())),
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.settings,
                            color: Colors.white,
                            size: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Settings',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: InkWell(
                      onTap: () => {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ChangePassword())),
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.lock_clock_rounded,
                            color: Colors.white,
                            size: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Change Password',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: InkWell(
                          onTap: (){
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: const Text("Alert!"),
                                content: const Text("Do you want to delete your account!"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(ctx).pop();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(14),
                                      child: const Text("OK"),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.delete_forever,
                                color: Colors.white,
                                size: 25,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Delete Account',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ))),
                  InkWell(
                    onTap: () => {},
                    child: Container(
                        margin: EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          children: [
                            Icon(
                              Icons.logout,
                              color: Colors.white,
                              size: 25,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: (){
                                FirebaseAuth.instance.signOut();
                              },
                              child:const Text(
                                'Logout',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )),
                  ),

                  InkWell(
                    onTap: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>TestPage())),
                    },
                    child: Container(
                        margin: EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          children: [
                            Icon(
                              Icons.logout,
                              color: Colors.white,
                              size: 25,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Test Page',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                    ),
                  )
                ],
              ),
            ),
          ]),
    );
  }
}
