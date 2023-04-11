import 'package:flutter/material.dart';
import 'package:pluto/config/config.dart' as CONFIG;
import 'Btns/primaryBtn.dart';
import 'cText.dart';
class CtaBanner extends StatefulWidget {
  const CtaBanner({Key? key}) : super(key: key);

  @override
  State<CtaBanner> createState() => _CtaBannerState();
}

class _CtaBannerState extends State<CtaBanner> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 155,
        margin: EdgeInsets.only( left:10, right: 10, top: 10, bottom: 10),
        padding: EdgeInsets.only(left: 15, right: 10, bottom: 10),
        decoration: BoxDecoration(
          color: CONFIG.primaryColor.withAlpha(90),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width-160,
              child: Column(children: [
                SizedBox(height: 20,),
                CText(text: 'The unconditional love of pet. ', fontSize: 16, fontWeight: FontWeight.bold,),
                SizedBox(height: 10,),
                CText(text: 'decrease stress, improve heart health, and even help children with their ',
                  maxLines: 2, fontSize: 13,),
                SizedBox(height: 15,),
                Align(
                    alignment: Alignment.centerLeft,
                    child: PrimaryBtn(ButtonTitle: "More...", height: 40, width: 150,))
              ],),
            ),
            SizedBox(width: 15,),
            Image.network("https://thumbs.dreamstime.com/b/hand-drawn-pets-portrait-cute-group-bird-cat-dog-fish-inside-its-tank-cartoon-vector-illustration-perfect-greeting-188013192.jpg",
              width: 95,

            )
          ],
        )
    );
  }
}
