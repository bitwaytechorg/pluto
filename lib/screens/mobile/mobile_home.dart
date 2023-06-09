import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../components/bottom_menu.dart';
import '../../components/notification_alert.dart';
import '../../components/post.dart';
import '../../components/scroll_behaviour.dart';
import '../../components/slider_menu.dart';
import '../../components/topbar.dart';
import 'package:pluto/config/config.dart' as CONFIG;
import 'package:pluto/global/session.dart' as SESSION;

import '../../models/post.dart';


class MobileHome extends StatefulWidget {
  @override
  MobileHomeState createState() => MobileHomeState();
}

class MobileHomeState extends State<MobileHome> {
  List<Post> results =[];

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
                  onTap: toggleMenu,
                  background: Colors.transparent,
                  secondaryWidget: InkWell(
                      onTap: () => {},
                      child: Container(
                        margin: EdgeInsets.only(top: 3, right: 5),
                        child: NotificationAlert(),
                      )),
                ),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: SingleChildScrollView(
                      child: buildContent(),
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: BottomMenu(active: 'home',)
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  buildContent() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection(CONFIG.post_collection).snapshots(),
      builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {

        if(snapshot.hasData){
          List DocList = snapshot.data!.docs;
          return ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: DocList.length,
              itemBuilder: (context, index){
                return PostSection(post: Post.fromMap(DocList[index].data()),);
              }
          );
        }else{
          return Container(child: Text("No Post"),);
        }
      },
    );

  }
}
