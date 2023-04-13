import 'package:flutter/material.dart';

import 'avatar.dart';

class ProductListTile extends StatefulWidget {
  String itemPic;
  String productName;
  String productDescription;
  double productPrice;
  ProductListTile({Key? key, required this.productName,required this.productDescription , required this.productPrice, this.itemPic=''}) : super(key: key);

  @override
  State<ProductListTile> createState() => _ProductListTileState();
}

class _ProductListTileState extends State<ProductListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.only(left: 10, right: 20),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.3))
      ),
      child: Row(children: [
        Image.network(widget.itemPic,
          height: 85,
          width: 90,
        ),
        SizedBox(width: 10,),
        Column(children: [
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(widget.productName, style: TextStyle(fontSize: 18),),
            Text("Rs 599"),
          ],),
          Text(widget.productDescription, style: TextStyle(
              fontSize: 15, color: Colors.grey),),
        ],),
      ],),
    );
  }
}
