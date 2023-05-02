
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
      postDescription,
      postSource,
      postCategory;


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
    this.postDescription='',
    this.postSource='',
    this.postCategory='',
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
       postDescription:json['postDescription'].toString(),
       postSource:json['postSource'].toString(),
      postCategory:json['postCategory'].toString(),
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
      postDescription:json['postDescription'].toString(),
      postSource:json['postSource'].toString(),
      postCategory:json['postCategory'].toString(),
     // resource:json['resource'].toString(),

    );
  }
  Map<String, dynamic> toMap()=>{
    "posterUserId":posterUserId,
    "posterName":posterName,
    "posterDpUrl":posterDpUrl,
    "postLocation":postLocation,
    "postId":postId,
    "postTitle":postTitle,
    "commentsCount":commentsCount,
    "likeCount":likeCount,
    "upVoteCount":upVoteCount,
    "downVoteCount":downVoteCount,
    "postDescription":postDescription,
    "postSource":postSource,
    "postCategory":postCategory
  };
}