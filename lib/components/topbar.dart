import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TopBar extends StatelessWidget {
  final Function() onTap;
  bool isDrawerOpen;
  bool isMainPage;
  bool isPrimaryBack;
  Widget? secondaryWidget;
  Widget? title;
  Color background;
  TopBar(
      {this.title,
      this.background = Colors.transparent,
      required this.isDrawerOpen,
      required this.onTap,
      this.isMainPage = true,
      this.isPrimaryBack = false,
      this.secondaryWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: this.background,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(isDrawerOpen ? 40 : 0.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 5,),
            child: InkWell(
              onTap: onTap,
              child: isDrawerOpen == false && isMainPage
                  ? Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.barsStaggered,
                          color: Colors.black,size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    )
                  : Container(
                      width: 40,
                      height: 40,
                      child: Icon(
                      FontAwesomeIcons.arrowLeft,
                        color: isPrimaryBack ? Colors.white : Colors.black54,
                        size: 20,
                      )),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 3, right: 10),
            child: this.title,
          ),
          Container(
            margin: EdgeInsets.only(top: 0, right: 10),
            child: secondaryWidget,
          ),
        ],
      ),
    );
  }
}
