import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pluto/screens/add_product_form.dart';
import 'package:pluto/screens/business_profile.dart';
import 'package:pluto/screens/product_detail.dart';

import '../components/productCard.dart';
import '../components/scroll_behaviour.dart';
import '../components/slider_menu.dart';
import '../components/topbar.dart';
import 'package:pluto/config/config.dart' as CONFIG;

import '../models/product.dart';

class StoreInfo extends StatefulWidget {
  @override
  StoreInfoState createState() => StoreInfoState();
}

class StoreInfoState extends State<StoreInfo> {
  List foodList = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbMYdu_oc5Drpw7Xp80UM3D7TmF8-xVzEvug&usqp=CAU",
    "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/61GbjUN3rPL._SY879_.jpg",
    "http://cdn.shopify.com/s/files/1/0589/8262/9516/products/doggos-mini-monster-492698.png?v=1679651795",
    "https://i0.wp.com/pawcare.ind.in/wp-content/uploads/2023/02/1-8.png?fit=1762%2C2494&ssl=1",
    "https://dogkart.in/ImageUploads/Orijen_Puppy_Recipe_A001.jpeg",
    "https://cdn.shopify.com/s/files/1/0410/0744/8216/products/Untitleddesign-131_1080x.png?v=1609744055",
    "https://cdn.shopify.com/s/files/1/0312/8826/2795/products/ACANADogPuppyRecipeFront2kgEMEAAPAC_700x700.jpg?v=1668589008",
    "https://m.media-amazon.com/images/I/71OMsaUqFyL._AC_SL1500_.jpg",
    "https://rukminim1.flixcart.com/image/416/416/khp664w0-0/pet-food/c/r/b/30-dog-931567-canine-creek-original-imafxnh9fekbxgha.jpeg?q=70",
    "https://dogkart.in/ImageUploads/Orijen_Puppy_Recipe_A001.jpeg",
    "https://cdn.shopify.com/s/files/1/0410/0744/8216/products/Untitleddesign-131_1080x.png?v=1609744055",
    "https://cdn.shopify.com/s/files/1/0312/8826/2795/products/ACANADogPuppyRecipeFront2kgEMEAAPAC_700x700.jpg?v=1668589008",
    "https://m.media-amazon.com/images/I/71OMsaUqFyL._AC_SL1500_.jpg",
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
                  title: Padding(
                    padding: const EdgeInsets.only(top: 6, right: 150),
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
                                builder: (context) => ProductForm(
                                      product: Product(),
                                    ))),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 6,
                          ),
                          child: Icon(
                            FontAwesomeIcons.plus,
                            size: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      PopupMenuButton(
                        itemBuilder: (BuildContext context) => [
                          PopupMenuItem(
                            child: Text("Delete"),
                          ),
                          PopupMenuItem(
                            child: Text("Delete All"),
                          ),
                          // PopupMenuItem(child: Text("KLMNO")),
                          // PopupMenuItem(child: Text("PQRST")),
                          // PopupMenuItem(child: Text("UVWXYZ")),
                        ],
                        child: Container(
                            margin: EdgeInsets.only(top: 5, ),
                            child: Icon(Icons.settings)),
                      ),
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
        itemBuilder: (context, index) => InkWell(

          onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>Product_detail())),
          child: ProductCard(
            productName: 'Good Food for Pets ',
            itemPic:foodList[index],
            productPrice: 435, productDescription: "",
          ),
        ),
      ),
    );
  }
}
