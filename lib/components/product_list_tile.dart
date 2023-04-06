import 'package:flutter/material.dart';

import 'avatar.dart';

class ProductListTile extends StatefulWidget {
  const ProductListTile({Key? key}) : super(key: key);

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Avatar(size: 50, ImageURL: ''),
            SizedBox(width: 10,),
            Column(children: [
              SizedBox(height: 30,),
              Text("Main Text", style: TextStyle(fontSize: 18),),
              Text("sec Text", style: TextStyle(
                  fontSize: 15, color: Colors.grey),),
            ],),
          ],),
          Text("More"),
        ],),
    );
  }
}
