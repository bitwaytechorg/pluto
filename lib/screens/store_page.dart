import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pluto/screens/add_product_form.dart';
import 'package:pluto/screens/business_profile.dart';

import '../components/bottom_menu.dart';
import '../components/notification_alert.dart';
import '../components/productCard.dart';
import '../components/scroll_behaviour.dart';
import '../components/slider_menu.dart';
import '../components/topbar.dart';

class StoreInfo extends StatefulWidget {
  @override
  StoreInfoState createState() => StoreInfoState();
}

class StoreInfoState extends State<StoreInfo> {
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
                  title: Padding(
                    padding: const EdgeInsets.only(top: 6, right: 210),
                    child: Text(
                      "STORE",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
                  isDrawerOpen: isDrawerOpen,
                  isMainPage: false,
                  onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Business_Profile())),
                  background: Colors.transparent,
                  secondaryWidget: Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddProductForm())),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 6,),
                          child: Icon(
                            FontAwesomeIcons.plus,
                            size: 20,
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                              child: Icon(Icons.more_vert_sharp)),
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
          ],
        ),
      ),
    );
  }

  buildContent() {
    return Container(
      height: MediaQuery.of(context).size.height - 55,
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: GridView.builder(
        itemCount: 13,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 4, crossAxisSpacing: 4),
        itemBuilder: (context, index) => ProductCard(
          productName: 'Good for food hghj gjk hiuh',
          productPrice: 435,
        ),
      ),
    );
  }
}
