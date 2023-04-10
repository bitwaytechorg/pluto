import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pluto/screens/store_page.dart';

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
                    child: Text("Details", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                  ),
                  isDrawerOpen: isDrawerOpen,
                  isMainPage: false,
                  onTap:()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Home())),
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
        Image.network("https://images.indianexpress.com/2021/04/puppy-1903313_1280.jpg",
          height: 250,
          width: 600,

        ),
        Padding(
          padding:EdgeInsets.only(top: 5, left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(" Author", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color: CONFIG.primaryColor),
              ),
              Text("Category",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: CONFIG.primaryColor),
              ),
            ],

          ),
        ),
        SizedBox(height: 30,),
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
                    children:[ Text("Dogs come in many shapes and sizes. The smallest breeds include the toy and miniature varieties, "
                        "such as the Toy Poodle, Papillon, Chihuahua, and Shih Tzu. These dogs usually weigh only 5 to 10 pounds (2.3 to 4.5 kilograms), "
                        "or even less. Medium-sized dogs include many of the terriers and spaniels, which weigh in the 10 to 50 pound (4.5 to 23 kilograms) range."
                        " Larger still are the retrievers, shepherds, and setters, which often weigh 65 to 100 pounds (30 to 45 kilograms). Finally, the giant breeds, "
                        "such as the Mastiff, Komondor, and Saint Bernard, can approach or exceed 200 pounds (91 kilograms). Of course, sizes vary within breeds,"
                        " with males usually being larger than females. Mixed-breed dogs include all size ranges."),
                  ],
                  ) ,
                ),
              )

            ],
          ),
        ),
        SizedBox(height: 20,),
        Container(
          width: 200,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: CONFIG.primaryColor,
          ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text("Average sizes and life \n expectancy of the breed", textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
        ),
        ),

      ],

    );

  }
}
