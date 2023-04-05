import 'package:flutter/material.dart';
import 'package:pluto/config/config.dart' as CONFIG;

import 'avatar.dart';

class ProductCard extends StatefulWidget {
  String productName;
  double productPrice;
  ProductCard({Key? key, required this.productName, required this.productPrice}) : super(key: key);

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
        borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      child: Column( children: [
        Stack(
          children: [
            Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqwq2r9y2JkZe8KSbEYG6VycyreR0Mop-ZoQ&usqp=CAU',
             height: 100,
              width: 120,
            ),
            Align(alignment: Alignment.topRight, child: Icon(Icons.favorite_border, color: Colors.pink,)),
          ], ),
        Container(
            margin: EdgeInsets.only(left: 10),
            child: Align(alignment: Alignment.centerLeft, child: Text(widget.productName, style: TextStyle(fontSize: 17 , ), softWrap: true, maxLines: 2,))),
        Container(
            margin: EdgeInsets.only(left: 10, top: 7, bottom: 4 ),
            child: Align(alignment: Alignment.centerLeft, child: Text("Price: " + widget.productPrice.toString(), style: TextStyle(color: Colors.grey),))),
      ],),
    );
  }
}