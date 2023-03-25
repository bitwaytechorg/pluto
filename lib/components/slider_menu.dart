
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/home.dart';

class Slider_menu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(

      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.blue,
      padding: EdgeInsets.only(top: 70),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child:InkWell(
                      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Home())),
                      child: Row(
                        children: [
                          Icon(Icons.ac_unit_outlined, color: Colors.black,size: 18,),
                          SizedBox(width: 10,),
                          Text('Dashboard', style: TextStyle(color: Colors.black87, fontSize:16,fontWeight: FontWeight.bold),)

                ],

              ),

            ),
          ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child:InkWell(
                      onTap: ()=> { },
                      child: Row(
                        children: [
                          Icon(Icons.face, color: Colors.black,size: 18,),
                          SizedBox(width: 10,),
                          Text('Profile', style: TextStyle(color: Colors.black87, fontSize:16,fontWeight: FontWeight.bold),)

                        ],

                      ),

                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: InkWell(
                      onTap: ()=> { },
                      child: Row(
                        children: [
                          Icon(Icons.lock_clock_rounded, color: Colors.black,size: 18,),
                          SizedBox(width: 10,),
                          Text('Change Password', style: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: InkWell(
                      onTap: ()=> { },
                      child: Row(
                        children: [
                          Icon(Icons.connect_without_contact_outlined, color: Colors.black,size: 18,),
                          SizedBox(width: 10,),
                          Text('Social Page ', style: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: InkWell(
                      onTap: ()=> { },
                      child: Row(
                        children: [
                          Icon(Icons.shopping_cart, color: Colors.black,size: 18,),
                          SizedBox(width: 10,),
                          Text('Market Place', style: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: InkWell(
                      onTap: ()=> { },
                      child: Row(
                        children: [
                          Icon(Icons.settings, color: Colors.black,size: 18,),
                          SizedBox(width: 10,),
                          Text('Settings', style: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ),

        ],
      ),

    ),
    ),
    ]
    ),
    );
  }
}
