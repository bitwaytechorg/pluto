import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pluto/components/avatar.dart';
import 'package:pluto/components/petCard.dart';
import '../../components/bottom_menu.dart';
import '../../components/cText.dart';
import '../../components/scroll_behaviour.dart';
import '../../components/search_bar.dart';
import '../../components/slider_menu.dart';
import '../../components/topbar.dart';
import 'package:pluto/config/config.dart' as CONFIG;

class Mobile_Information extends StatefulWidget {


  @override
  Mobile_InformationState createState() => Mobile_InformationState();
}

class Mobile_InformationState extends State<Mobile_Information> {



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
                borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0),
              ),
              child: Column(children: [
                TopBar(
                  isDrawerOpen: isDrawerOpen,
                  onTap: toggleMenu,
                  background: Colors.transparent,
                  secondaryWidget: Row(
                    children: [
                      SearchBar( width: 260, onSearch: (String searchText) {  },),
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
                Align(
                  alignment: Alignment.bottomCenter,
                  child: BottomMenu(active: 'Information'),
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
        child: Column(children: [

          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: CText(text:"Suggestion",
                fontSize: 22, fontWeight: FontWeight.w400,
              ),
            ),
          ),

          Container(
            height: 140,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: 9,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 140,
                  width: 100,

                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: Colors.grey.withAlpha(40),
                  ),
                  child: Column(children: [
                    SizedBox(height: 5,),
                    Avatar(size: 60, ImageURL: 'https://i.ytimg.com/vi/MPV2METPeJU/maxresdefault.jpg'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: CText(text:"A complete guide for your pet at hindustantimes.com." , fontSize: 13, maxLines: 2,),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: CText(text: "More...", fontSize: 12, color: CONFIG.primaryColor,)),
                    ),
                  ],),
                );
              },

            ),
          ),


          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: CText(text:"Category",
                fontSize: 22, fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            height: 210,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: 9,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                    onTap: (){

                    },
                   child: PetCard(),
                );
              },

            ),
          ),

        ],),
      );
  }

}
