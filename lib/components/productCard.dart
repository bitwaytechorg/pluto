import 'package:flutter/material.dart';
import 'package:pluto/config/config.dart' as CONFIG;

import 'avatar.dart';
import 'cText.dart';

class ProductCard extends StatefulWidget {
  String itemPic;
  String productName;
  String productDescription;
  double productPrice;

  ProductCard({Key? key, required this.productName, required this.productDescription, required this.productPrice, this.itemPic=''}) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 190,
      width: 150,
      padding: EdgeInsets.only(left: 10, right: 10, top: 5,),
      decoration: BoxDecoration(
        border: Border.all(width: 0.1, color: CONFIG.primaryColor),
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Colors.white,
      ),
      child: Column( children: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.only(left: 30, top: 5),
              height: 100,
              width: 100,
              child: Image.network(widget.itemPic,),
            ),
            Align(alignment: Alignment.topRight, child: Icon(Icons.favorite_border, color: Colors.pink,)),
          ], ),
        Align(alignment: Alignment.center, child: CText(text:widget.productName, maxLines: 2, fontSize: 17,)),
        Align(alignment: Alignment.center, child: Text("Price: " + widget.productPrice.toString(), style: TextStyle(color: Colors.grey),)),
        Align(alignment: Alignment.center, child: CText(text:widget.productDescription, maxLines: 1, fontSize: 17,)),
      ],),
    );
  }
}
