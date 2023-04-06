import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pluto/components/product_list_tile.dart';
import 'package:pluto/components/search_bar.dart';
import 'package:pluto/screens/product_detail.dart';
import '../../components/bottom_menu.dart';
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

                      // PopupMenuButton(
                      //   color: Colors.black54,
                      //   icon: Icon(Icons.filter_list_alt),
                      //   itemBuilder: (ctx) => [
                      //    _buildPopupMenuItem("menu");
                      //   ],
                      // ),
                    ],
                  ),
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
        /// List container and Grid container///
        viewType=="List" ? Container(
          height: MediaQuery.of(context).size.height-230,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return ProductListTile();
            }
          ),
        ): Container(
          height: MediaQuery.of(context).size.height-210,
          margin: EdgeInsets.symmetric(horizontal: 5),
          child: GridView.builder(
            itemCount: 13,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4
            ),

            itemBuilder: (context, index) => InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Product_detail()));
              },
                child: ProductCard(productName: 'Good for food hghj gjk hiuh', productPrice: 435,)),
          ),
        ),
      ],);

  }

  /// Filter Popup menu function///
  // PopupMenuItem _buildPopupMenuItem(
  //     String title) {
  //   return PopupMenuItem(
  //     onTap: (){
  //       setState(() {
  //
  //       });
  //     },
  //     child:  Text(title),
  //   );
  // }
}
