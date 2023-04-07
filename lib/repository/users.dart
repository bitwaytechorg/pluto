
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository{

  Future<Map<String,dynamic>> save(userData) async {
    await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid)
        .update(userData.toMap());
    return {"status":"success"};
  }
}