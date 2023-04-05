import 'package:flutter/material.dart';
import 'package:pluto/components/Btns/primaryBtn.dart';

class Mobile_product_detail extends StatefulWidget {
  const Mobile_product_detail({Key? key}) : super(key: key);

  @override
  State<Mobile_product_detail> createState() => _Mobile_product_detailState();
}

class _Mobile_product_detailState extends State<Mobile_product_detail> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(child: Text("image slider"),),
      Row(children: [
        Text("product name"),
        Icon(Icons.favorite),
      ],),
      Row(children: [
        Text("product name"),
        Icon(Icons.favorite),
      ],),
      PrimaryBtn(ButtonTitle: "Add to Cart"),

    ],);
  }
}
