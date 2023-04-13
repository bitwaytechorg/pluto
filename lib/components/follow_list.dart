import 'package:flutter/material.dart';

import 'avatar.dart';
import 'cText.dart';

class FollowList extends StatefulWidget {
  String profileURL;
  String username;

   FollowList({Key? key, required this.profileURL, required this.username}) : super(key: key);

  @override
  State<FollowList> createState() => _FollowListState();
}

class _FollowListState extends State<FollowList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 12,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 0.1)),
                  color: Colors.grey.withAlpha(10)
              ),
              height: 70,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5, left: 15),
                    child: Avatar(size: 40, ImageURL: widget.profileURL),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width - 140,
                      padding: EdgeInsets.only(top: 5, left: 15),
                      child: CText(
                        text: widget.username, fontSize: 15, maxLines: 2,)
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
