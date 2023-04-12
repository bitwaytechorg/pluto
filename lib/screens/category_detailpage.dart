import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pluto/components/Btns/customBtn.dart';
import 'package:pluto/components/Btns/secondaryBtn.dart';
import 'package:pluto/screens/store_page.dart';

import '../components/avatar.dart';
import '../components/cText.dart';
import '../components/chips.dart';
import '../components/scroll_behaviour.dart';
import '../components/slider_menu.dart';
import '../components/topbar.dart';
import 'home.dart';
import 'package:pluto/config/config.dart' as CONFIG;

class CategoryDetailPage extends StatefulWidget {
  const CategoryDetailPage({Key? key}) : super(key: key);

  @override
  State<CategoryDetailPage> createState() => _CategoryDetailPageState();
}

class _CategoryDetailPageState extends State<CategoryDetailPage> {
  List facts = [
    "Their eyes also change colour – they’re blue at birth but they change to a grey, blue-grey or light amber as they get older.",
    "They’re referred to as the ‘grey ghost’ partly because of the colour of their coat, but also from their notorious, stealth-like hunting style.",
    "Their eyes also change colour – they’re blue at birth but they change to a grey, blue-grey or light amber as they get older.",
    "They’re referred to as the ‘grey ghost’ partly because of the colour of their coat, but also from their notorious, stealth-like hunting style.",
    "Their eyes also change colour – they’re blue at birth but they change to a grey, blue-grey or light amber as they get older.",
    "They’re referred to as the ‘grey ghost’ partly because of the colour of their coat, but also from their notorious, stealth-like hunting style.",


  ];
  List title = [
    "Overview",
    "History",
    "Apperance",
    "--------",
    "--------",
    "--------",
    "--------",
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
                    padding: const EdgeInsets.only(top: 6, right: 220, left: 5),
                    child: Text(
                      "Details",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
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
    return Column(
      children: [
        Row(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
                child: Text(
                  "Weimaraner",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: CONFIG.primaryColor),
                ),
              ),
            ),
          ],
        ),
        //Image.network("https://images.indianexpress.com/2021/04/puppy-1903313_1280.jpg",
        //height: 200,
        //width: 600,

        //),
        Container(
          height: 250,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              itemCount: 4,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 5, left: 10, right: 20),
                  child: Container(
                    height: 350,
                    //width: 200,
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: Colors.grey.withAlpha(40),
                    ),
                    child: Column(
                      children: [
                        Image.network(
                          "https://images.indianexpress.com/2021/04/puppy-1903313_1280.jpg",
                          height: 200,
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
        SizedBox(
          height: 5,
        ),

        Container(
          height: 80,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: title.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                  child: SecondaryBtn(
                    buttonTitle: title[index],
                  ),
                );
              }),
        ),
        SizedBox(
          height: 20,
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Wrap(
                        children: [
                          Text(
                              "Dogs come in many shapes and sizes. The smallest breeds include the toy and miniature varieties, "
                              "such as the Toy Poodle, Papillon, Chihuahua, and Shih Tzu. These dogs usually weigh only 5 to 10 pounds (2.3 to 4.5 kilograms), "
                              "or even less. Medium-sized dogs include many of the terriers and spaniels, which weigh in the 10 to 50 pound (4.5 to 23 kilograms) range."
                              " Larger still are the retrievers, shepherds, and setters, which often weigh 65 to 100 pounds (30 to 45 kilograms). Finally, the giant breeds, "
                              "such as the Mastiff, Komondor, and Saint Bernard, can approach or exceed 200 pounds (91 kilograms). Of course, sizes vary within breeds,"
                              " with males usually being larger than females. Mixed-breed dogs include all size ranges."),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
              children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CText( text: 'Origin:', color: CONFIG.primaryColor,fontSize: 16,),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 45),
                  child: CText( text: 'Germany',fontSize: 16,),
                ),
              ],
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CText( text: 'Height:',color: CONFIG.primaryColor,fontSize: 16,),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: CText( text: 'Dogs = 59-70 sm',fontSize: 16,),
                ),
              ],
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CText( text: 'Weight:',color: CONFIG.primaryColor,fontSize: 16,),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: CText( text: "Dogs = 30-40 kg",fontSize: 16,),
                ),
              ],
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CText( text: 'Life Span:',color: CONFIG.primaryColor,fontSize: 16,),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: CText( text: '10-13 years',fontSize: 16,),
                ),
              ],
            ),

          ]),
        ),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            child: Row(
              children: [
                CText(text: "Breed Characteristics:", color: Colors.black87),
              ],
            ),
          ),
        ),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CText( text: 'Aggressiveness:', color: CONFIG.primaryColor, fontSize: 16,),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 150),
                child: CText( text: 'Low',fontSize: 16,),
              ),
            ],
          ),
        ),
        SizedBox(height: 5,),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CText( text: 'Activity:', color: CONFIG.primaryColor,fontSize: 16,),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 200),
                child: CText( text: 'Very high',fontSize: 16,),
              ),
            ],
          ),
        ),
        SizedBox(height: 5,),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CText( text: 'Attitude towards loneliness:', color: CONFIG.primaryColor,fontSize: 16,),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: CText( text: 'Does not tolerate',fontSize: 16,),
              ),
            ],
          ),
        ),
        SizedBox(height: 5,),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CText( text: 'Complexity of care:', color: CONFIG.primaryColor,fontSize: 16,),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 130),
                child: CText( text: 'Low',fontSize: 16,),
              ),
            ],
          ),
        ),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            children:[
              CText(text: 'Basic Facts:-', color: Colors.black87,),

            ],
          ),
        ),
        SizedBox(height: 10,),

    //     Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: Column(
    //         children: [
    //           Padding(
    //             padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10, right: 10),
    //             child: Text(" Their eyes also change colour – they’re blue at birth but they change to a grey, blue-grey or light amber as they get older."),
    //           ),
    //       Padding(
    //         padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10, right: 10),
    //         child: Text( "They’re referred to as the ‘grey ghost’ partly because of the colour of their coat, but also from their notorious, stealth-like hunting style."),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10, right: 10),
    //         child: Text(" Their eyes also change colour – they’re blue at birth but they change to a grey, blue-grey or light amber as they get older."),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.only(left: 10,bottom: 10, top: 10, right: 10),
    //         child: Text( "They’re referred to as the ‘grey ghost’ partly because of the colour of their coat, but also from their notorious, stealth-like hunting style."),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.only(left: 10,bottom: 10, top: 10, right: 10),
    //         child: Text(" Their eyes also change colour – they’re blue at birth but they change to a grey, blue-grey or light amber as they get older."),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.only(left: 10,bottom: 10, top: 10, right: 10),
    //         child: Text( "They’re referred to as the ‘grey ghost’ partly because of the colour of their coat, but also from their notorious, stealth-like hunting style."),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.only(left: 10,bottom: 10, top: 10, right: 10),
    //         child: Text(" Their eyes also change colour – they’re blue at birth but they change to a grey, blue-grey or light amber as they get older."),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.only(left: 10,bottom: 10, top: 10, right: 10),
    //         child: Text( "They’re referred to as the ‘grey ghost’ partly because of the colour of their coat, but also from their notorious, stealth-like hunting style."),
    //       ),
    // ],
    //       ),
    //     ),
        Container(
          child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: facts.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
                  child: Container(
                    child: Text(facts[index]),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
