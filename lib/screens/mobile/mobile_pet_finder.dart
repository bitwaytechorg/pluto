import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pluto/components/avatar.dart';
import 'package:pluto/components/bottom_menu.dart';
import 'package:pluto/components/search_bar.dart';
import '../../components/UserCard.dart';
import '../../components/scroll_behaviour.dart';
import 'package:pluto/config/config.dart' as CONFIG;
import '../home.dart';

class Mobile_PetFinder extends StatefulWidget {
  @override
  Mobile_PetFinderState createState() => Mobile_PetFinderState();
}

class Mobile_PetFinderState extends State<Mobile_PetFinder> {

  List petOwners = [
    "Dileep Kumar","Aaryan",
    "Carolyn","Morgan",
    "Albert","Walker",
    "Randy","Reed",
    "Larry","Barnes",
    "Lois","Wilson",
    "Jesse","Campbell",
    "Ernest","Rogers",
    "Theresa","Patterson",
    "Henry","Simmons",
    "Michelle","Perry",
    "Frank","Butler",
    "Shirley"
  ];

  List location= [
    "Chandigarh",
    "Delhi",
    "Haryana",
    "HP",
    "Jammu and Kashmir",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttarakhand",
    "Uttar Pradesh",
    "West Bengal",
    "Daman and Diu",
    "Lakshadweep",
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Puducherry"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Column(children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                        onTap:(){ Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));},
                        child: Icon(Icons.arrow_back, color: Colors.grey)),

                    SizedBox(width: 15,),
                    Text("Pet Finder", style: TextStyle(
                      fontSize: 20, color: Colors.black54,
                      fontWeight: FontWeight.w400,
                    ),),
                  ],
                ),
                SearchBar(width: 200, onSearch: (String searchText) {  },)
              ],
            ),
          ),
          Divider(color: Colors.grey,),
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
              child: BottomMenu(active: 'Pet Finder',)
          ),
        ]),
      ),
    );
  }

  buildContent() {
    return Container(
      padding: EdgeInsets.only(bottom: 20, top: 5),
      child: Column(
        children: [
          Column(children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Breeders", style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.w500,
                ),),
              ),
            ),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: petOwners.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return UserCard(name: petOwners[index], services: 3, location: location[index],);
                },

              ),
            ),

            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Grooming", style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.w400,
                ),),
              ),
            ),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: petOwners.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return UserCard(name: petOwners[index], services: 3, location: location[index],);
                },

              ),
            ),

            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Pets trainers", style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.w400,
                ),),
              ),
            ),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: petOwners.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return UserCard(name: petOwners[index], services: 3, location: location[index],);
                },

              ),
            ),

            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Veterinary doctors", style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.w400,
                ),),
              ),
            ),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: petOwners.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return UserCard(name: petOwners[index], services: 3, location: location[index],);
                },

              ),
            ),

            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Pet walkers", style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.w400,
                ),),
              ),
            ),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: petOwners.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return UserCard(name: petOwners[index], services: 3, location: location[index],);
                },

              ),
            ),
          ],)
        ],
      ),
    );

  }
}
