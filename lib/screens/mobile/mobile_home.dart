import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/topbar.dart';

class MobileHome extends StatefulWidget {
  @override
  MobileHomeState createState() => MobileHomeState();
}

class MobileHomeState extends State<MobileHome> {
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
            Drawer(),
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
                  title: Image.asset("assets/images/logo.png", height: 35),
                  background: Colors.grey[200]!,
                  secondaryWidget: InkWell(
                    onTap: () => {},
                    child: Container(
                        margin: EdgeInsets.only(top: 3, right: 5),
                        child: Image.asset(
                          "assets/images/support.png",
                          width: 35,
                          height: 35,
                        )),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
