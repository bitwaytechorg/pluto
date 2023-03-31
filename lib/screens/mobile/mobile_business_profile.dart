import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../components/scroll_behaviour.dart';
import '../../components/search_bar.dart';
import '../../components/slider_menu.dart';
import '../../components/topbar.dart';

class Mobile_BusinessProfile extends StatefulWidget {
  @override
  Mobile_BusinessProfileState createState() => Mobile_BusinessProfileState();
}

class Mobile_BusinessProfileState extends State<Mobile_BusinessProfile> {
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
                    isMainPage: false,
                    onTap: () => Navigator.pop(context),
                    background: Colors.transparent,
                    secondaryWidget: SearchBar(
                      width: MediaQuery.of(context).size.width - 65,
                      onSearch: (String searchText) {},
                    )),
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

  buildContent() {}
}
