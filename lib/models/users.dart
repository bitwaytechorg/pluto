import 'dart:convert';

class User{
   String
      userId,
      name,
      email,
      phone,
      dob,
      gender;

    User({
    this.userId='',
    this.name='',
    required this.email,
    this.phone='',
    this.dob='',
    this.gender=''
   });
  factory User.fromJson(Map<String,dynamic> json){
    return User(

        userId:json['userId'].toString(),
        name:json['name'].toString(),
        email:json['email'].toString(),
        phone:json['phone'].toString(),
        dob:json['dob'].toString(),
        gender:json['gender'].toString()

    );
  }
  factory User.fromMap(Map<String,dynamic>json){
    return User(
        userId:json['userId'].toString(),
        name: json['name'].toString(),
        email: json['email'].toString(),
        phone: json['phone'].toString(),
        dob: json['dob'].toString(),
        gender: json['gender'].toString()

    );
  }
}