import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pluto/components/scroll_behaviour.dart';
import '../../models/post.dart';
import '../home.dart';
import 'package:pluto/config/config.dart' as CONFIG;
import 'package:pluto/global/session.dart' as SESSION;


class Mobile_Addpost extends StatefulWidget {
  @override
  Mobile_AddpostState createState() => Mobile_AddpostState();
}

class Mobile_AddpostState extends State<Mobile_Addpost> {

  final storageRef = FirebaseStorage.instance.ref();
  String filePath = '';
  String postImageURL= '';

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
                          onTap: ()  async{
                            /// store file in firebase storage///
                            Reference postDirImages = storageRef.child("postImages");
                            Reference imageToUploadRef = postDirImages.child("images");
                            try {
                              await imageToUploadRef.putFile(File(filePath));
                              postImageURL= await imageToUploadRef.getDownloadURL() ;
                            }catch(e){
                              print("firebase error: $e");
                            }

                            addPostHandler( Post(
                            postTitle: titleController.text,
                            postDescription: descriptionController.text,
                            postCategory: categoryController.text,
                            posterUserId:SESSION.uid,
                            posterName: SESSION.firstName,
                            posterDpUrl:"posterDpUrl",
                            postLocation:"postLocation",
                            postId:"postId",
                            commentsCount:"0",
                            likeCount:"0",
                            upVoteCount:"0",
                            downVoteCount:"0",
                            postSource:postImageURL,
                            profileUrl:"profileUrl",

                          ));

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
                      InkWell(
                        onTap: (){
                          imagePicker();
                        },
                        child: Container(
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.grey.withAlpha(100),
                              borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                            child: Image.file(File(filePath)),
                        ),
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

  void addPostHandler(Post post) async {

    FirebaseFirestore.instance.collection(CONFIG.post_collection)
        .add(post.toMap())
        .then((docRef) {
      FirebaseFirestore.instance.collection(CONFIG.post_collection).doc(docRef.id).update(
          {"postId": docRef.id});

    }).catchError((e) {
      print("$e this error appears...");
    });

  }

  Future<void> imagePicker() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      filePath= file!.path;
    });

  }


}
