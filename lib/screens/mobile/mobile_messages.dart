import 'package:flutter/material.dart';

import '../../components/scroll_behaviour.dart';


class MobileMessages extends StatefulWidget {
  const MobileMessages({Key? key}) : super(key: key);

  @override
  State<MobileMessages> createState() => _MobileMessagesState();
}

class _MobileMessagesState extends State<MobileMessages> {
  TextEditingController textEditingController = TextEditingController();
  late String senderMessage, receiverMessage;
  ScrollController scrollController = ScrollController();


  double xOffset = 0;
  double yOffset = 0;
  double scalefactor = 1;
  bool isDrawerOpen = false;

  void toggleMenu() {
    bool tmpStatus = !isDrawerOpen;
    setState(() {
      xOffset = tmpStatus ? 250 : 0;
      yOffset = tmpStatus ? 50 : 0;
      scalefactor = tmpStatus ? 0.91 : 1;
      isDrawerOpen = tmpStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Column(children: [
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
                        child: Icon(Icons.arrow_back, color: Colors.grey)
                    ),
                    SizedBox(width: 15,),
                    Text("Username", style: TextStyle(
                      fontSize: 20, color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),),
                  ],
                ),
                Icon(Icons.more_vert, color: Colors.grey),
              ],
            ),
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
      );
  }

  buildContent() {
    return Column(
      children: [

        Container(
          child: Text("Username", style: TextStyle(
            fontSize: 20, color: Colors.grey,
            fontWeight: FontWeight.w400,
          ),),
        ),
      ],
    );
  }
}
