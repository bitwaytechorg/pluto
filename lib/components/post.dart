import 'package:flutter/material.dart';

class PostSection extends StatefulWidget {
  String userId;
  String postId;
  String postTitle;
  String comments;
  String like;
  String dislike;
  String imageUrl;
  String profileUrl;


  PostSection({Key? key,
    required this.userId,
    required this.postId,
    required this.postTitle,
    required this.comments,
    required this.like,
    required this.dislike,
    required this.imageUrl,
    required this.profileUrl
  }) : super(key: key);

  @override
  State<PostSection> createState() => _PostSectionState();
}

class _PostSectionState extends State<PostSection> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder(child: Text("PostSection"),);
  }
}
