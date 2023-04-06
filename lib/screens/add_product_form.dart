import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pluto/screens/store_page.dart';

import '../components/Btns/customBtn.dart';
import '../components/scroll_behaviour.dart';
import '../components/slider_menu.dart';
import '../components/topbar.dart';
import 'business_profile.dart';
import 'package:pluto/config/config.dart'as CONFIG;

class AddProductForm extends StatefulWidget {
  const AddProductForm({Key? key}) : super(key: key);

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
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
                    padding: const EdgeInsets.only(top: 6, right: 220, left: 5),
                    child: Text("Add Product", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                  ),
                  isDrawerOpen: isDrawerOpen,
                  isMainPage: false,
                  onTap:()=> Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => StoreInfo())),
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
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.grey.withAlpha(100),
                borderRadius: BorderRadius.all(Radius.circular(5))
            ),
          ),
          SizedBox(height: 15,),
          Align(alignment: Alignment.centerLeft,
              child: Text("Title", style: TextStyle(color: Colors.grey),)),
          TextField(
            decoration: InputDecoration(
              hintText: 'fakjd fdajkj fdjac',
            ),
          ),
          SizedBox(height: 10,),
          Align(alignment: Alignment.centerLeft,
              child: Text("Desciption", style: TextStyle(color: Colors.grey),)),
          TextField(
            decoration: InputDecoration(
              hintText: 'Real Estate App designed by uix.martin',
            ),
          ),
          SizedBox(height: 10,),
          Align(alignment: Alignment.centerLeft,
              child: Text("Category", style: TextStyle(color: Colors.grey),)),
          TextField(
            decoration: InputDecoration(
              hintText: 'options',
            ),
          ),
          SizedBox(height: 40,),
          Padding(
            padding: EdgeInsets.only(left: 100, right: 50, top: 20),
            child: Row(
              children: [
                InkWell(
                  onTap: () => {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Business_Profile()),)},
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: CONFIG.primaryColor,
                      //borderRadius: BorderRadius.circular(10),
                    ),
                    child: CustomBtn(
                        height: 40,
                        width: 155,
                        buttonTitle: "Add Product",
                        color: CONFIG.primaryColor),
                  ),
                ),
    ],
              ),
          ),
        ],
      ),
    );


  }

}
