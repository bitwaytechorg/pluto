import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      color: this.background,
      alignment: Alignment.topLeft,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10),
            child: InkWell(
              onTap: onTap,
              child: isDrawerOpen == false && isMainPage
                  ? Row(
                      children: [
                        Icon(
                          Icons.menu,
                          color: Colors.black,
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
                        Icons.arrow_back_ios,
                        color: isPrimaryBack ? Colors.white : Colors.black87,
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
