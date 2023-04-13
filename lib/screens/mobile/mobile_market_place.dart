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

  List foodList=[
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

  String viewType='List';
  List chips =[
    "Dogs",
    "Cats",
    "Birds",
    "Fishes",
    "all pets"
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
        viewType=="List" ? Container(
          height: MediaQuery.of(context).size.height-230,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: 13,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Product_detail()));
                  },
                  child: ProductListTile(productName: "fds fhsdf", productPrice: 399.5, itemPic:foodList[index],));
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
                child: ProductCard(productName: 'Good for dogs',itemPic: foodList[index], productPrice: 435,)),
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
