import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../components/scroll_behaviour.dart';
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
  XFile file = XFile("");
  String postImageURL = '';
  final ImagePicker _picker = ImagePicker();

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
                            Reference imageToUploadRef = postDirImages.child('images' + file.name);
                            try {
                              await imageToUploadRef.putFile(File(filePath));
                              postImageURL = await imageToUploadRef.getDownloadURL();

                            }catch(e){
                              print("firebase error: $e");
                            }

                              addPostHandler( Post(
                              postTitle: titleController.text,
                              postDescription: descriptionController.text,
                              postCategory: categoryController.text,
                              posterUserId:SESSION.uid,
                              posterName: SESSION.firstName,
                              posterDpUrl:SESSION.profileUrl,
                              postLocation:"postLocation",
                              postId:"postId",
                              postSource:postImageURL,

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
                            width: MediaQuery.of(context).size.width,
                            constraints: BoxConstraints(minHeight: 200, maxHeight: 300),
                            child: filePath==''?Image(fit: BoxFit.fill,image:AssetImage("assets/images/placeholder.jpg")):Image.file(File(filePath))
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
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
      );
      setState(() {
        file = pickedFile!;
        filePath = pickedFile!.path;
      });
    } catch (e) {
      setState(() {
        // _pickImageError = e;
      });
    }
  }


}
