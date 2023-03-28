
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pluto/config/config.dart' as CONFIG;
import '../screens/home.dart';
import '../screens/mobile/mobile_Profile.dart';
import 'package:pluto/global/session.dart' as SESSION;
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
          Container(
              width: 250,
              height:100,
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 20),
              child:Avatar(size: 100, ImageURL:SESSION.profileUrl, )),

          ///menu items
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    padding: EdgeInsets.fromLTRB(0,80,0,5),
                    width: 250,
                    decoration: BoxDecoration(
                      border: Border(bottom:BorderSide(color: Color(0xCCFFFFFF))),
                    ),
                    child: Text('Account',style: TextStyle(color:Colors.white)),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 25),
                    child: InkWell(
                      onTap: ()=> { },
                      child: Row(
                        children: [
                          Icon(Icons.settings, color: Colors.white,size: 25,),
                          SizedBox(width: 10,),
                          Text('Settings', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 25),
                    child: InkWell(
                      onTap: ()=> { },
                      child: Row(
                        children: [
                          Icon(Icons.lock_clock_rounded, color: Colors.white,size: 25,),
                          SizedBox(width: 10,),
                          Text('Change Password', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 30),
                      child:InkWell(
                          onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Home())),
                          child: Row(
                            children: [
                              Icon(Icons.delete_forever, color: Colors.white,size: 25,),
                              SizedBox(width: 10,),
                              Text('Delete_account', style: TextStyle(color: Colors.white, fontSize:16,fontWeight: FontWeight.bold),)
                            ],
                          )
                      )),
                  InkWell(
                    onTap: ()=> {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Mobile_Profile())),
                    },
                    child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                Icon(Icons.logout, color: Colors.white,size: 25,),
                                SizedBox(width: 10,),
                                Text('logout', style: TextStyle(color: Colors.white, fontSize:16,fontWeight: FontWeight.bold),)
                              ],
                            )
                        ),
                  )
          ],),
      ),

    ),
    ]
    ),
    );
  }
}
