import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:pluto/config/config.dart' as CONFIG;
import '../models/post.dart';
import 'avatar.dart';
import 'cText.dart';

class PostSection extends StatefulWidget {
  final Post post;
  PostSection({ required this.post, });

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
                Avatar(size: 50, ImageURL:widget.post!.posterDpUrl),
                SizedBox(width: 10,),
                Container(
                  width: MediaQuery.of(context).size.width-200,
                  child: Column(
                    children: [
                      Container( width: MediaQuery.of(context).size.width, child: CText( text:widget.post!.posterName,)),
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
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(widget.post!.postTitle,
                style: TextStyle(color: Colors.grey, fontSize: 17),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15,0, 10, 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(widget.post!.postDescription,
                style: TextStyle(color: Colors.grey, fontSize: 15),),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            constraints: BoxConstraints(minHeight: 300, maxHeight: 450),
            child: CachedNetworkImage(imageUrl: widget.post!.postSource,fit: BoxFit.cover, placeholder:(context, url)=>Image(fit: BoxFit.fill,image:AssetImage("assets/images/No_Image.jpg")),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    LikeButton(
                      likeCount: widget.post!.likeCount,
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
