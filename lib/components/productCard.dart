import 'package:flutter/material.dart';
import 'package:pluto/config/config.dart' as CONFIG;

import 'avatar.dart';
import 'cText.dart';

class ProductCard extends StatefulWidget {
  String itemPic;
  String productName;
  double productPrice;
  ProductCard({Key? key, required this.productName, required this.productPrice, this.itemPic=''}) : super(key: key);

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
            Image.network(widget.itemPic,
             height: 100,
              width: 120,
            ),
            Align(alignment: Alignment.topRight, child: Icon(Icons.favorite_border, color: Colors.pink,)),
          ], ),
        Container(
            margin: EdgeInsets.only(left: 10),
            child: Align(alignment: Alignment.centerLeft, child: CText(text:widget.productName, maxLines: 2, fontSize: 17,))),
        Container(
            margin: EdgeInsets.only(left: 10, top: 7, bottom: 4 ),
            child: Align(alignment: Alignment.centerLeft, child: Text("Price: " + widget.productPrice.toString(), style: TextStyle(color: Colors.grey),))),
      ],),
    );
  }
}
