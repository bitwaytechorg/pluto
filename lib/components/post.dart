import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:pluto/components/avatar.dart';
import 'package:pluto/components/custom_image.dart';
import 'package:pluto/config/config.dart' as CONFIG;

import 'cText.dart';

class PostSection extends StatefulWidget {
  String postTitle, postDescription, postImageURL;
  PostSection({
    required this.postTitle,
    required this.postDescription,
    required this.postImageURL,
   });

  @override
  State<PostSection> createState() => _PostSectionState();
}

class _PostSectionState extends State<PostSection> {
  late int upvote, downvote;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Row(children: [
               SizedBox(width: 5,),
               Avatar(size: 50, ImageURL: 'https://people.com/thmb/SL7_3mF5irtEm4Kz8f63FWDrmPA=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():focal(999x0:1001x2)/dog-dating-1-a1a34ab3445740fcadf8699850c8333b.jpg'),
               SizedBox(width: 10,),
               Container(
                 width: MediaQuery.of(context).size.width-200,
                 child: Column(
                   children: [
                     Container( width: MediaQuery.of(context).size.width, child: CText(text:"Dileep Kumar")),
                     Container(width: MediaQuery.of(context).size.width, child: CText(text:"4h ago", fontSize: 12,)),
                   ],
                 ),
               ),
             ],),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(Icons.more_vert),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 8, 10, 15),
            child: Text(widget.postTitle,
              style: TextStyle(color: Colors.grey, fontSize: 15),),
          ),
          Custom_Image(imageUrl: widget.postImageURL),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               Row(
                 children: [
                   LikeButton(
                     likeCount: 223,
                     likeBuilder: (bool isLiked) {
                       return Icon(
                         Icons.thumb_up_rounded,
                         color: isLiked ? CONFIG.primaryColor : Colors.black.withAlpha(140),
                         size: 22,
                       );
                     },),
                      SizedBox(width: 5,),
                    LikeButton(
                     likeCount: 43,
                     likeBuilder: (bool isLiked) {
                       return Icon(
                         Icons.thumb_down_alt_rounded,
                         color: isLiked ? Colors.deepPurpleAccent : Colors.black.withAlpha(140),
                         size: 22,
                       );
                     },),

                   Row(
                     children: [
                       SizedBox(width: 15,),
                       InkWell(
                           onTap: (){

                           },
                           child: Icon(Icons.comment, color: Colors.black.withAlpha(140),size: 20,)),
                       SizedBox(width:5,),
                       Text("35")
                     ],
                   ),

                 ],
               ),
                InkWell(
                    onTap: (){
                     
                    },
                    child: Icon(Icons.share, size: 20, color: Colors.black.withAlpha(140),)),

              ],
            ),
          ),
          Divider(thickness: 1, endIndent: 5, indent: 5,),

        ],
      ),
    );
  }

}
