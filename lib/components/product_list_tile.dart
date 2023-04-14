import 'package:flutter/material.dart';
import 'cText.dart';

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
        border: Border(bottom: BorderSide(width: 0.2))
      ),
      child: Row(children: [
        Image.network(widget.itemPic,
          height: 85,
          width: 90,
        ),
        SizedBox(width: 20,),
        Column(children: [
          SizedBox(height: 15,),
          Container(
            width: MediaQuery.of(context).size.width-145,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Container( width: 160,child: CText(text:widget.productName, fontSize: 17,)),
              CText(text:"Rs. ${widget.productPrice.toString()}", color: Colors.grey, fontSize: 13,),
            ],),
          ),
          SizedBox(height: 10,),
          Container(width:MediaQuery.of(context).size.width-145 , child: CText(text:widget.productDescription, fontSize: 14, maxLines: 2,)),
        ],),
      ],),
    );
  }
}
