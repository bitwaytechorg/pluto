import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pluto/components/bottom_menu.dart';
import 'package:pluto/components/search_bar.dart';
import '../../components/UserCard.dart';
import '../../components/cText.dart';
import '../../components/cta_banner.dart';
import '../../components/scroll_behaviour.dart';
import '../home.dart';
import 'mobile_Profile.dart';

class Mobile_PetFinder extends StatefulWidget {
  @override
  Mobile_PetFinderState createState() => Mobile_PetFinderState();
}

class Mobile_PetFinderState extends State<Mobile_PetFinder> {

  List profileURL=[
    "https://images.unsplash.com/photo-1587402092301-725e37c70fd8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Y3V0ZSUyMGRvZ3xlbnwwfHwwfHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1582456891925-a53965520520?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Y3V0ZSUyMGRvZ3xlbnwwfHwwfHw%3D&w=1000&q=80",
    "https://image.cnbcfm.com/api/v1/image/106686172-1598966433320-gettyimages-1152439648-istockalypse-home-office-00062.jpeg?v=1599013160",
    "https://paradepets.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTkxMzY1Nzg4NjczMzIwNTQ2/cutest-dog-breeds-jpg.jpg",
    "https://images.hindustantimes.com/rf/image_size_630x354/HT/p2/2018/11/11/Pictures/_b39a21a8-e577-11e8-bdc4-2ad11fc65eb2.jpg",
    "https://images.unsplash.com/photo-1587402092301-725e37c70fd8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Y3V0ZSUyMGRvZ3xlbnwwfHwwfHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1582456891925-a53965520520?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Y3V0ZSUyMGRvZ3xlbnwwfHwwfHw%3D&w=1000&q=80",
    "https://image.cnbcfm.com/api/v1/image/106686172-1598966433320-gettyimages-1152439648-istockalypse-home-office-00062.jpeg?v=1599013160",
    "https://paradepets.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTkxMzY1Nzg4NjczMzIwNTQ2/cutest-dog-breeds-jpg.jpg",
    "https://images.hindustantimes.com/rf/image_size_630x354/HT/p2/2018/11/11/Pictures/_b39a21a8-e577-11e8-bdc4-2ad11fc65eb2.jpg",
    "https://images.unsplash.com/photo-1587402092301-725e37c70fd8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Y3V0ZSUyMGRvZ3xlbnwwfHwwfHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1582456891925-a53965520520?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Y3V0ZSUyMGRvZ3xlbnwwfHwwfHw%3D&w=1000&q=80",
    "https://image.cnbcfm.com/api/v1/image/106686172-1598966433320-gettyimages-1152439648-istockalypse-home-office-00062.jpeg?v=1599013160",
    "https://paradepets.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTkxMzY1Nzg4NjczMzIwNTQ2/cutest-dog-breeds-jpg.jpg",
    "https://images.hindustantimes.com/rf/image_size_630x354/HT/p2/2018/11/11/Pictures/_b39a21a8-e577-11e8-bdc4-2ad11fc65eb2.jpg",
    "https://images.unsplash.com/photo-1587402092301-725e37c70fd8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Y3V0ZSUyMGRvZ3xlbnwwfHwwfHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1582456891925-a53965520520?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Y3V0ZSUyMGRvZ3xlbnwwfHwwfHw%3D&w=1000&q=80",
    "https://image.cnbcfm.com/api/v1/image/106686172-1598966433320-gettyimages-1152439648-istockalypse-home-office-00062.jpeg?v=1599013160",
    "https://paradepets.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTkxMzY1Nzg4NjczMzIwNTQ2/cutest-dog-breeds-jpg.jpg",
    "https://images.hindustantimes.com/rf/image_size_630x354/HT/p2/2018/11/11/Pictures/_b39a21a8-e577-11e8-bdc4-2ad11fc65eb2.jpg",
    "https://images.unsplash.com/photo-1587402092301-725e37c70fd8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Y3V0ZSUyMGRvZ3xlbnwwfHwwfHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1582456891925-a53965520520?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Y3V0ZSUyMGRvZ3xlbnwwfHwwfHw%3D&w=1000&q=80",
    "https://image.cnbcfm.com/api/v1/image/106686172-1598966433320-gettyimages-1152439648-istockalypse-home-office-00062.jpeg?v=1599013160",
    "https://paradepets.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTkxMzY1Nzg4NjczMzIwNTQ2/cutest-dog-breeds-jpg.jpg",
    "https://images.hindustantimes.com/rf/image_size_630x354/HT/p2/2018/11/11/Pictures/_b39a21a8-e577-11e8-bdc4-2ad11fc65eb2.jpg",
    "https://images.unsplash.com/photo-1587402092301-725e37c70fd8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Y3V0ZSUyMGRvZ3xlbnwwfHwwfHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1582456891925-a53965520520?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Y3V0ZSUyMGRvZ3xlbnwwfHwwfHw%3D&w=1000&q=80",
    "https://image.cnbcfm.com/api/v1/image/106686172-1598966433320-gettyimages-1152439648-istockalypse-home-office-00062.jpeg?v=1599013160",
    "https://paradepets.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTkxMzY1Nzg4NjczMzIwNTQ2/cutest-dog-breeds-jpg.jpg",
    "https://images.hindustantimes.com/rf/image_size_630x354/HT/p2/2018/11/11/Pictures/_b39a21a8-e577-11e8-bdc4-2ad11fc65eb2.jpg"
  ];

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
    "JK",
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
          Container(height:0.3,width: MediaQuery.of(context).size.width, color: Colors.grey,),
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
      child: Column(children: [
       CtaBanner(title: 'your pet, your responsibility', description: 'Make sure pets get regular veterinary care along with a good diet, fresh water, shelter, and exercise', imageURL: '',),

        Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: CText(text:"Breaders",
              fontSize: 25, fontWeight: FontWeight.w400,
            ),
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
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Mobile_Profile()));
                },
                  child: UserCard(name: petOwners[index],profileURL: profileURL[index], services: 3, location: location[index],));
            },

          ),
        ),

        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: CText(text:"Grooming",
              fontSize: 25, fontWeight: FontWeight.w400,
            ),
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
              return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => Mobile_Profile()));
                  },
                  child: UserCard( name: petOwners[index],profileURL: profileURL[index], services: 3, location: location[index],));
            },

          ),
        ),

        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: CText(text:"Pets Trainers",
              fontSize: 25, fontWeight: FontWeight.w400,
            ),
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
              return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => Mobile_Profile()));
                  },
                  child: UserCard(name: petOwners[index],profileURL: profileURL[index], services: 3, location: location[index],));
            },

          ),
        ),

        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: CText(text:"Veterinary doctors",
              fontSize: 25, fontWeight: FontWeight.w400,
             ),
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
              return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => Mobile_Profile()));
                  },
                  child: UserCard(name: petOwners[index],profileURL: profileURL[index], services: 3, location: location[index],));
            },

          ),
        ),

        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: CText(text:"Pet walkers",
              fontSize: 25, fontWeight: FontWeight.w400,
            ),
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
              return InkWell(child: UserCard(name: petOwners[index], services: 3, location: location[index],));
            },

          ),
        ),
      ],),
    );

  }
}
