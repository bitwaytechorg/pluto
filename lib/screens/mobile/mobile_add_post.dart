import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pluto/components/scroll_behaviour.dart';
import '../home.dart';


class Mobile_Addpost extends StatefulWidget {
  @override
  Mobile_AddpostState createState() => Mobile_AddpostState();
}

class Mobile_AddpostState extends State<Mobile_Addpost> {
  bool loading = false;
 final databaseRef = FirebaseDatabase.instance.ref("Post");

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
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
                              child: Icon(Icons.arrow_back, color: Colors.grey)
                          ),

                          SizedBox(width: 15,),
                          Text("Upload", style: TextStyle(
                            fontSize: 20, color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),),
                        ],
                      ),
                      InkWell(
                          onTap: (){

                          },
                          child: Icon(Icons.check, color: Colors.grey)),
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
                        controller: titleController,
                        decoration: InputDecoration(
                          hintText: '...',
                        ),
                      ),
                      SizedBox(height: 10,),
                      Align(alignment: Alignment.centerLeft,
                          child: Text("Desciption", style: TextStyle(color: Colors.grey),)),
                      TextField(
                        controller: descriptionController,
                        decoration: InputDecoration(
                          hintText: '...',
                        ),
                      ),
                      SizedBox(height: 10,),
                      Align(alignment: Alignment.centerLeft,
                          child: Text("Category", style: TextStyle(color: Colors.grey),)),
                      TextField(
                        controller: categoryController,
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
      ),
    );
  }
}
