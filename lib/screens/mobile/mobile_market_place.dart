import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pluto/components/product_list_tile.dart';
import 'package:pluto/components/search_bar.dart';
import 'package:pluto/screens/product_detail.dart';
import '../../components/bottom_menu.dart';
import '../../components/cText.dart';
import '../../components/chips.dart';
import 'package:pluto/config/config.dart' as CONFIG;
import '../../components/productCard.dart';
import '../../components/scroll_behaviour.dart';
import '../../components/slider_menu.dart';
import '../../components/topbar.dart';

class Mobile_MarketPlace extends StatefulWidget {
  @override
  Mobile_MarketPlaceState createState() => Mobile_MarketPlaceState();
}

class Mobile_MarketPlaceState extends State<Mobile_MarketPlace> {


  String viewType='Grid';
  List chips =[
    "Dogs",
    "Cats",
    "Birds",
    "Fishes",
    "all pets",
    "Cats",
    "Birds",
    "Fishes",
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
                  borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0),
                  ),
              child: Column(children: [
                TopBar(
                  isDrawerOpen: isDrawerOpen,
                  onTap: toggleMenu,
                  background: Colors.transparent,
                  secondaryWidget: Row(
                    children: [
                      SearchBar(width: 240, onSearch: (String searchText) {  },),
                       Icon(Icons.filter_list_alt, color: Colors.black54,),
                    ],
                  ),
                ),
                Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap:(){
                            setState(() {
                              viewType= "List";
                            });
                        },
                          child: CText(text:"List")),
                      InkWell(
                          onTap: (){
                            setState(() {
                              viewType= "Grid";
                            });
                          },
                          child: CText(text:"Grid"))
                    ],),
                ),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 0.3, color: Colors.grey),)
                  ),
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
                    child: BottomMenu(active: 'MarketPlace'),
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

        /// List container and Grid container///
        StreamBuilder(
          stream: FirebaseFirestore.instance.collection(CONFIG.product_collection).snapshots(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if(snapshot.connectionState== ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
            else if(snapshot.hasData){

              return viewType=="List" ? Container(
                height: MediaQuery.of(context).size.height-230,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot products = snapshot.data.docs[index];
                      return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Product_detail()));
                          },
                          child: ProductListTile(productName: products["productTitle"], productPrice: products["price"], itemPic:products['productImage'], productDescription: products["description"],));
                    }
                ),
              ):  Container(
                height: MediaQuery.of(context).size.height-210,
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.docs.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    DocumentSnapshot products = snapshot.data.docs[index];
                      return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>Product_detail()));
                        },
                        child: ProductCard(
                            itemPic: products["productImage"],
                            productName: products["productTitle"],
                            productPrice: products["price"]),
                      );
                      },
                  ),
              );
            }else{
              return Center(child: Text("No Items"),);
            }
          },

        ),
      ],);

  }
}
