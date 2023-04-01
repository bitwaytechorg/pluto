import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../home.dart';


class Mobile_Addpost extends StatefulWidget {
  @override
  Mobile_AddpostState createState() => Mobile_AddpostState();
}

class Mobile_AddpostState extends State<Mobile_Addpost> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        InkWell(
                            onTap:(){ Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));},
                            child: Icon(Icons.arrow_back, color: Colors.grey)),

                        SizedBox(width: 15,),
                        Text("Upload", style: TextStyle(
                          fontSize: 20, color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),),
                      ],
                    ),
                    Icon(Icons.check, color: Colors.grey),
                  ],
                ),
              ),
              Divider(color: Colors.grey,),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.grey.withAlpha(100),
                          borderRadius: BorderRadius.all(Radius.circular(5))
                      ),

                     // child: Text("Image Container"),
                      //child: ImagePicker(),
                    ),
                    SizedBox(height: 15,),
                    Align(alignment: Alignment.centerLeft,
                        child: Text("Title", style: TextStyle(color: Colors.grey),)),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'fakjd fdajkj fdjac',
                      ),
                    ),
                    SizedBox(height: 10,),
                    Align(alignment: Alignment.centerLeft,
                        child: Text("Desciption", style: TextStyle(color: Colors.grey),)),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Real Estate App designed by uix.martin',
                      ),
                    ),
                    SizedBox(height: 10,),
                    Align(alignment: Alignment.centerLeft,
                        child: Text("Price", style: TextStyle(color: Colors.grey),)),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'fakjd fdajkj fdjac',
                      ),
                    ),
                    SizedBox(height: 10,),
                    Align(alignment: Alignment.centerLeft,
                        child: Text("Category", style: TextStyle(color: Colors.grey),)),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'options',
                      ),
                    ),


                  ],
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
