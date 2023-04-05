import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pluto/config/config.dart' as CONFIG;
import 'package:pluto/screens/tablet/tablet_product_detail.dart';
import 'package:pluto/screens/web/web_product_detail.dart';

import 'mobile/mobile_product_detail.dart';

class Product_detail extends StatefulWidget{
  @override
  Product_detailState createState()=>Product_detailState();
}

class Product_detailState extends State<Product_detail>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints){
              if(constraints.maxWidth<=CONFIG.MOBILE_SCREEN_SIZE){
                //device is mobile
                return Mobile_product_detail();
              } else if(constraints.maxWidth>CONFIG.MOBILE_SCREEN_SIZE && constraints.maxWidth<=CONFIG.TABLET_SCREEN_SIZE){
                //device is tablet
                return Tablet_product_detail();
              } else {
                //device is web
                return Web_product_detail();
              }
            }
        ),
      ),
    );
  }
}