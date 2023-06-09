import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pluto/screens/mobile/mobile_user_profile.dart';

import '../components/avatar.dart';
import '../components/scroll_behaviour.dart';
import '../components/slider_menu.dart';
import '../components/topbar.dart';
import 'package:pluto/global/session.dart' as SESSION;
import 'package:pluto/config/config.dart' as CONFIG;
import 'dart:io' as io;

class UserProfileForm extends StatefulWidget {
  const UserProfileForm({Key? key}) : super(key: key);

  @override
  State<UserProfileForm> createState() => UserProfileFormState();
}

class UserProfileFormState extends State<UserProfileForm> {
  double xOffset = 0;
  double yOffset = 0;
  double scalefactor = 1;
  bool isDrawerOpen = false;

  XFile file = XFile("");
  String filePath = "";
  final ImagePicker _picker = ImagePicker();
  late UploadTask uploadTask;
  String message = "";

  void toggleMenu() {
    bool tmpStatus = !isDrawerOpen;
    setState(() {
      xOffset = tmpStatus ? 250 : 0;
      yOffset = tmpStatus ? 50 : 0;
      scalefactor = tmpStatus ? 0.91 : 1;
      isDrawerOpen = tmpStatus;
    });
  }

  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController dob = TextEditingController();

  @override
  void initState() {
    firstname.text = SESSION.firstName;
    lastname.text = SESSION.lastName;
    description.text = SESSION.description;
    email.text = SESSION.email;
    phone.text = SESSION.phoneNumber;
  }

  Future<void> pickImage() async {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Slider_menu(),
            AnimatedContainer(
              width: MediaQuery.of(context).size.width,
              transform: Matrix4.translationValues(xOffset, yOffset, 0)
                ..scale(scalefactor)
                ..rotateY(isDrawerOpen ? -0.5 : 0),
              duration: Duration(milliseconds: 250),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0)),
              child: Column(children: [
                TopBar(
                  isDrawerOpen: isDrawerOpen,
                  isMainPage: false,
                  onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Mobile_UserProfile())),
                  background: Colors.transparent,
                ),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: SingleChildScrollView(
                      child: buildContent(),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  buildContent() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          //show top area
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                InkWell(
                    onTap: () {
                      pickImage();
                    },
                    child: Avatar(
                      size: 150,
                      ImageURL: SESSION.profileUrl,
                      ImageFile: file,
                      isFile: file.path != "" ? true : false,
                    )),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    SESSION.firstName + " " + SESSION.lastName,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: CONFIG.primaryColor),
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: CONFIG.primaryColor,
            indent: 20,
            endIndent: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1, color: Colors.grey[300]!))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 10, bottom: 10),
                          child: Text(
                            "First Name",
                            style: TextStyle(color: CONFIG.primaryColor),
                          ),
                        ),
                        TextFormField(
                          controller: firstname,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            hintText: "First Name",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 15, bottom: 10),
                          child: Text(
                            "Last Name",
                            style: TextStyle(color: CONFIG.primaryColor),
                          ),
                        ),
                        TextFormField(
                          controller: lastname,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            hintText: "Last Name",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 15, bottom: 10),
                          child: Text(
                            "Description",
                            style: TextStyle(color: CONFIG.primaryColor),
                          ),
                        ),
                        TextFormField(
                          controller: description,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            hintText: "Description",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 15, bottom: 10),
                          child: Text(
                            "Email",
                            style: TextStyle(color: CONFIG.primaryColor),
                          ),
                        ),
                        TextFormField(
                          controller: email,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            hintText: "Enter Email",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 15, bottom: 10),
                          child: Text(
                            "Phone ",
                            style: TextStyle(color: CONFIG.primaryColor),
                          ),
                        ),
                        TextFormField(
                          controller: phone,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            hintText: "Enter Phone",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 15, bottom: 10),
                          child: Text(
                            "DOB",
                            style: TextStyle(color: CONFIG.primaryColor),
                          ),
                        ),
                        TextFormField(
                          controller: dob,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            hintText: "Enter DOB",
                          ),
                        ),
                      ],
                    )),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 120),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: CONFIG.primaryColor
                    ),
                   onPressed: () async {
                        if (file.path != "") {
                          //upload file
                          Reference ref = FirebaseStorage.instance
                              .ref('display-picture/'+ SESSION.uid + "profilePhoto");
                          final metadata = SettableMetadata(
                            contentType: file.mimeType,
                          );
                          uploadTask = ref.putFile(io.File(file.path), metadata);
                          uploadTask.snapshotEvents.listen((event) async {
                            double progress = (event.bytesTransferred.toDouble() /
                                    event.totalBytes.toDouble()) *
                                100;

                            setState(() {
                              message =
                                  "Uploading Image...${progress.floor().toString()}%";
                            });
                            if (event.state == TaskState.success) {
                              String tmp_path = await ref.getDownloadURL();
                              SESSION.profileUrl = tmp_path;
                              FirebaseFirestore.instance
                                  .collection("users")
                                  .doc(FirebaseAuth.instance.currentUser!.uid)
                                  .update({"profileUrl": SESSION.profileUrl});
                              setState(() {
                                message = "Image Uploaded!";
                              });
                            }
                          });
                        }
                        SESSION.firstName = firstname.text.toString();
                        SESSION.lastName = lastname.text;
                        SESSION.description = description.text;
                        SESSION.email = email.text;
                        SESSION.phoneNumber = phone.text;
                        SESSION.dob = dob.text;

                        //save in database
                        await FirebaseFirestore.instance
                            .collection("users")
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .update({
                          "firstName": SESSION.firstName,
                          "lastName": SESSION.lastName,
                          "description": SESSION.description,
                          "email": SESSION.email,
                          "phoneNumber": SESSION.phoneNumber,
                          "dob": SESSION.dob,
                        });
                        setState(() {
                          message = "Profile Updated!";
                        });
                      },
                      child: Text("Update")),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(message),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
