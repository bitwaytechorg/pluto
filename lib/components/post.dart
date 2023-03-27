import 'package:flutter/material.dart';
import 'package:pluto/models/post.dart';

class PostSection extends StatefulWidget {
  Post postData;
  PostSection({Key? key,
    required this.postData,
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
