import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pluto/components/Btns/primaryBtn.dart';
import 'package:pluto/config/config.dart' as CONFIG;
import '../../components/scroll_behaviour.dart';

class MobileProductDetail extends StatefulWidget {
  DocumentSnapshot product;
  MobileProductDetail({Key? key, required this.product}) : super(key: key);

  @override
  State<MobileProductDetail> createState() => _MobileProductDetailState();
}

class _MobileProductDetailState extends State<MobileProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                          onTap:(){ Navigator.pop(context);},
                          child: Icon(Icons.arrow_back, color: Colors.grey)),

                      SizedBox(width: 15,),
                      Text(widget.product['productTitle'], style: TextStyle(
                        fontSize: 20, color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),),
                    ],
                  ),
                  Icon(Icons.more_vert, color: Colors.grey),

                 // Icon(Icons.check, color: Colors.grey),
                ],
              ),
            ),
            Container(height: 0.2,width: MediaQuery.of(context).size.width, color: Colors.black54,),

            Expanded(
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: SingleChildScrollView(
                  child: buildContent(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  buildContent(){
    return Column(children: [
      Container(height: MediaQuery.of(context).size.height-340, width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.grey.withAlpha(100)
        ),
        child: Image.network(widget.product['productImage']),
      ),
       SizedBox(height: 20,),
      Container(
        margin: EdgeInsets.only(left: 15, right: 20),

        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("Best food for birds", style: TextStyle(
            fontSize: 22, color: Colors.black54,
          ),),
          Icon(Icons.favorite, color: Colors.black54, size: 25,),
        ],),
      ),
      SizedBox(height: 15,),
      Container(
        margin: EdgeInsets.only(left: 15, right: 20),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(widget.product['price'], style: TextStyle(
            fontSize: 15, color: Colors.black54,
          ),),
          Row(children: [
            Icon(Icons.star_sharp, color: CONFIG.starColor, size: 15,),
            Icon(Icons.star_sharp, color: CONFIG.starColor, size: 15,),
            Icon(Icons.star_sharp, color: CONFIG.starColor, size: 15,),
            Icon(Icons.star_sharp, color: CONFIG.starColor, size: 15,),
            Icon(Icons.star_sharp, color: Colors.black54, size: 15,),
          ],)
        ],),
      ),
      Divider(thickness: 0.3,),
      Container(
        margin: EdgeInsets.only(left: 15, right: 20, top: 5, bottom: 20),
        child: Column(
          children: [
            Align( alignment: Alignment.centerLeft,
              child: Text(widget.product['productDescription'], style: TextStyle(
                fontSize: 18, color: Colors.black54,
              ),),
            ),
            SizedBox(height: 7,),
            Text("A light and airy texture. Gooey: A viscous, sometimes sticky texture arising from the presence",
             style: TextStyle(
              color: Colors.black54
             ),
            ),

          ],
        ),
      ),

      Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Align(alignment: Alignment.centerRight, child: PrimaryBtn(ButtonTitle: "Add to Cart")),
      ),

    ],);
  }

}
