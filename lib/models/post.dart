
class Post{
  String posterUserId,
      posterName,
      posterDpUrl,
      postLocation,
      postGeoLocation,
      postId,
      postTitle,
      postDescription,
      postSource,
      postCategory;
  int  commentsCount, likeCount, upVoteCount, downVoteCount;


  //Map<String, dynamic> resource;

  Post({
    this.posterUserId='',
    this.posterName='',
    this.posterDpUrl='',
    this.postLocation='',
    this.postGeoLocation='',
    this.postId='',
    this.postTitle='',
    this.postDescription='',
    this.postSource='',
    this.postCategory='',
    this.commentsCount=0,
    this.likeCount=0,
    this.upVoteCount=0,
    this.downVoteCount=0,
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
      postDescription:json['postDescription'].toString(),
      postSource:json['postSource'].toString(),
      postCategory:json['postCategory'].toString(),
      commentsCount:int.parse(json['commentsCount'].toString(),),
      likeCount:int.parse(json['likeCount'].toString()),
      upVoteCount:int.parse(json['upVoteCount'].toString(),),
      downVoteCount:int.parse(json['downVoteCount'].toString(),),
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
      postDescription:json['postDescription'].toString(),
      postSource:json['postSource'].toString(),
      postCategory:json['postCategory'].toString(),
      commentsCount:int.parse(json['commentsCount'].toString(),),
      likeCount:int.parse(json['likeCount'].toString(),),
      upVoteCount:int.parse(json['upVoteCount'].toString(),),
      downVoteCount:int.parse(json['downVoteCount'].toString(),),
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
    "postDescription":postDescription,
    "postSource":postSource,
    "postCategory":postCategory,
    "commentsCount":commentsCount,
    "likeCount":likeCount,
    "upVoteCount":upVoteCount,
    "downVoteCount":downVoteCount,
  };
}