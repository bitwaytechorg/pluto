import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pluto/components/avatar.dart';
import 'package:pluto/components/search_bar.dart';

import '../../components/bottom_menu.dart';
import '../../components/chips.dart';
import 'package:pluto/config/config.dart' as CONFIG;
import '../../components/scroll_behaviour.dart';
import '../../components/slider_menu.dart';
import '../../components/topbar.dart';

class Mobile_MarketPlace extends StatefulWidget {
  @override
  Mobile_MarketPlaceState createState() => Mobile_MarketPlaceState();
}

class Mobile_MarketPlaceState extends State<Mobile_MarketPlace> {

  List chips =[
    "developers",
    "responsive",
  ];


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
                      onTap: (){},
                      child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Text("Filter"))),
                ),
                SearchBar(width: 250, onSearch: (String searchText) {  },),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: chips.length,
                      itemBuilder: (context,index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                          child: Chips(chipTitle: chips[index],),
                        );
                      }
                  ),
                ),
                Divider(),
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
                    child: BottomMenu(active: 'Market Place'),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  buildContent() {
      return Column(children: [
        Container(
          height: 70,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: CONFIG.primaryColor),
          ),
          child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Row(children: [
              Avatar(size: 50, ImageURL: ''),
              SizedBox(width: 10,),
              Column(children: [
                SizedBox(height: 10,),
                Text("Main Text", style: TextStyle(fontSize: 18),),
                Text("sec Text",style: TextStyle(fontSize: 15, color: Colors.grey),),
              ],),
            ],),
            Text("More"),
          ],),
        ),

        Container(
          height: 150,
          width: MediaQuery.of(context).size.width/3,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: CONFIG.primaryColor),
          ),
          child: Text('userCard'),
        ),
      ],);

  }
}
