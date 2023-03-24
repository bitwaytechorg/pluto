import 'dart:convert';

class Post{
  String userId,
      postId,
      postTitle,
      comments,
      like,
      imageUrl,
      profileUrl,
      dislike;
  Post({
    this.userId='',
    this.postId='',
    this.postTitle='',
    this.comments='',
    this.like='',
    this.dislike='',
    this.profileUrl='',
    this.imageUrl=''
  });
  factory Post.fromJson(Map<String,dynamic> json){
    return Post(
        userId:json['userId'].toString(),
        postId:json['postId'].toString(),
        postTitle:json['postTitle'].toString(),
        comments:json['comments'].toString(),
        like:json['like'].toString(),
        dislike:json['dislike'].toString(),
        profileUrl:json['profileUrl'].toString(),
        imageUrl:json['imageUrl'].toString()

    );
  }
  factory Post.fromMap(Map<String,dynamic>json){
    return Post(
        userId: json['userId'].toString(),
        postId: json['postId'].toString(),
        postTitle: json['postTitle'].toString(),
        comments: json['comments'].toString(),
        like: json['like'].toString(),
        dislike: json['dislike'].toString(),
        profileUrl: json['profileUrl'].toString(),
        imageUrl: json['imageUrl'].toString()

    );
  }
}