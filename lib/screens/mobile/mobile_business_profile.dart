import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pluto/screens/store_page.dart';
import '../../components/Btns/customBtn.dart';
import '../../components/avatar.dart';
import '../../components/chips.dart';
import '../../components/post.dart';
import '../../components/productCard.dart';
import '../../components/scroll_behaviour.dart';
import '../../components/search_bar.dart';
import '../../components/slider_menu.dart';
import '../../components/topbar.dart';
import 'package:pluto/config/config.dart' as CONFIG;

class Mobile_BusinessProfile extends StatefulWidget {
  @override
  Mobile_BusinessProfileState createState() => Mobile_BusinessProfileState();
}

class Mobile_BusinessProfileState extends State<Mobile_BusinessProfile> {
  String onTabActive = 'activity';
  List chips = [
    "#Dog",
    "#Cat",
    "#Birds",
    "#Fishes",
    "#python",
    "#react",
    "#developers",
    "#responsive",
    "#manager",
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
                      padding: EdgeInsets.only(right: 180, top: 5),
                      child: Text("Business Profile", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
                  isDrawerOpen: isDrawerOpen,
                  isMainPage: false,
                  onTap: () => Navigator.pop(context),
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Avatar(
                    size: 100,
                    ImageURL:
                        "https://www.websiteclosers.com/wp-content/uploads/2021/05/Puppy_640x480.jpg"),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Center(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "200",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Posts',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Column(
                                  children: [
                                    Text(
                                      "200K",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Followers',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    "200K",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Following',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, top: 15, right: 210),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bhumika Tiwari",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 15, bottom: 10),
                      child: SizedBox(height: 5)),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                          color: Colors.black.withAlpha(120), fontSize: 15),
                      children: <TextSpan>[
                        TextSpan(text: 'Chandigarh, India          '),
                        TextSpan(text: 'Flutter Developer'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: chips.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                    child: Chips(
                      chipTitle: chips[index],
                    ),
                  );

                }),

          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 8, top: 15),
            child: Row(
              children: [
                InkWell(
                  onTap: () => {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Store()),)},
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: CONFIG.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: CustomBtn(
                        height: 40,
                        width: 155,
                        buttonTitle: "Follow ",
                        color: CONFIG.primaryColor),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () => {},
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: CONFIG.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: CustomBtn(
                        height: 40,
                        width: 155,
                        buttonTitle: "Store",
                        color: CONFIG.primaryColor),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            endIndent: 5,
            indent: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // InkWell(
                    //   onTap: () {
                    //     setState(() {
                    //       onTabActive = "store";
                    //     });
                    //   },
                    //   child: Row(
                    //     children: [
                    //       Icon(Icons.store_mall_directory_outlined,size: 30,
                    //           color: onTabActive == "store"
                    //               ? CONFIG.primaryColor
                    //               : Colors.grey),
                    //       SizedBox(
                    //         width: 5,
                    //       ),
                    //       Text(
                    //         "Store",
                    //         style: TextStyle(
                    //             color: onTabActive == "store"
                    //                 ? CONFIG.primaryColor
                    //                 : Colors.grey, fontSize: 15),
                    //       )
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(
                    //   width: 150,
                    // ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          onTabActive = "activity";
                        });
                      },
                      child: Row(
                        children: [
                          Icon(Icons.table_chart,
                              color: onTabActive == "activity"
                                  ? CONFIG.primaryColor
                                  : Colors.grey),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Activity",
                            style: TextStyle(
                                color: onTabActive == "activity"
                                    ? CONFIG.primaryColor
                                    : Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Icon(CupertinoIcons.slider_horizontal_3, color:Colors.grey),
              ],
            ),
          ),
          Divider(thickness: 1, endIndent: 5, indent: 5,),
          Container(
            height: MediaQuery.of(context).size.height-55,
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: GridView.builder(
              itemCount: 13,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4
              ),

              itemBuilder: (context, index) => ProductCard(productName: 'Good for food hghj gjk hiuh', productPrice: 435,),
            ),
          ),

        ],
      ),
    );
  }
}
