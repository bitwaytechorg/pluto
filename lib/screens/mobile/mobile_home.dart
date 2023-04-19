import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pluto/components/bottom_menu.dart';
import 'package:pluto/components/post.dart';
import 'package:pluto/components/slider_menu.dart';
import 'package:pluto/models/post.dart';
import '../../components/notification_alert.dart';
import '../../components/scroll_behaviour.dart';
import '../../components/topbar.dart';
import 'package:pluto/config/config.dart' as CONFIG;

class MobileHome extends StatefulWidget {
  @override
  MobileHomeState createState() => MobileHomeState();
}

class MobileHomeState extends State<MobileHome> {
  List<Post> results =[];
  @override
  void initState() {

    Future<List<Post>> fetch() async {
      var response = await FirebaseFirestore.instance.collection(CONFIG.post_collection).get().catchError((e) {
        return false;
      });
      if(response.docs.length>0){
        response.docs.forEach((element) {
          results.add(Post.fromMap(element.data()));
        });
      }
      return results;
    }
    fetch();
    super.initState();
  }

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
    print(results);
    return ListView.builder(
         shrinkWrap: true,
         itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
        return PostSection();
      },

    );
  }
}
