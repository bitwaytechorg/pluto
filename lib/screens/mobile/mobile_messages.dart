import 'package:flutter/material.dart';

class MobileMessages extends StatefulWidget {
  const MobileMessages({Key? key}) : super(key: key);

  @override
  State<MobileMessages> createState() => _MobileMessagesState();
}

class _MobileMessagesState extends State<MobileMessages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                          onTap:(){ Navigator.pop(context);},
                          child: Icon(Icons.arrow_back, color: Colors.grey)),

                      SizedBox(width: 15,),
                      Text("Username", style: TextStyle(
                        fontSize: 20, color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),),
                    ],
                  ),
                  Icon(Icons.more_vert, color: Colors.grey),

                  // Icon(Icons.check, color: Colors.grey),
                ],
              ),
            ),
            Container(
              child: Text("chating..."),
            ),
          ],
        ),
      ),
    );
  }
}
