import 'dart:convert';

class Post{
  String posterUserId,
     posterName,
     posterDpUrl,
     postLocation,
     postGeoLocation,
      postId,
      postTitle,
      commentsCount,
      likeCount,
      upVoteCount,
      downVoteCount,
      profileUrl;
  //Map<String, dynamic> resource;

  Post({
    this.posterUserId='',
    this.posterName='',
    this.posterDpUrl='',
    this.postLocation='',
    this.postGeoLocation='',
    this.postId='',
    this.postTitle='',
    this.commentsCount='',
    this.likeCount='',
    this.upVoteCount='',
    this.downVoteCount='',
    this.profileUrl='',
   // required this.resource,
  });
  factory Post.fromJson(Map<String,dynamic> json){
    return Post(
        posterUserId:json['posterUserId'].toString(),
        posterName:json['posterName'].toString(),
        posterDpUrl:json['posterDpUrl'].toString(),
        postLocation:json['postLocation'].toString(),
        postId:json['postId'].toString(),
        postTitle:json['postTitle'].toString(),
        commentsCount:json['commentsCount'].toString(),
        likeCount:json['likeCount'].toString(),
        upVoteCount:json['upVoteCount'].toString(),
        downVoteCount:json['downVoteCount'].toString(),
        profileUrl:json['profileUrl'].toString(),
       // resource:json['resource'].toString(),

    );
  }
  factory Post.fromMap(Map<String,dynamic>json){
    return Post(
      posterUserId:json['posterUserId'].toString(),
      posterName:json['posterName'].toString(),
      posterDpUrl:json['posterDpUrl'].toString(),
      postLocation:json['postLocation'].toString(),
      postId:json['postId'].toString(),
      postTitle:json['postTitle'].toString(),
      commentsCount:json['commentsCount'].toString(),
      likeCount:json['likeCount'].toString(),
      upVoteCount:json['upVoteCount'].toString(),
      downVoteCount:json['downVoteCount'].toString(),
      profileUrl:json['profileUrl'].toString(),
     // resource:json['resource'].toString(),

    );
  }
}