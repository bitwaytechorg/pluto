
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pluto/config/config.dart' as CONFIG;

import '../models/product.dart';

class  ProductRepo {
  Future<bool> save(Product product) async {
    if (product.product_id != '') {
      product.updated_at = DateTime.now().toUtc().toString();
      product.updated_by = FirebaseAuth.instance.currentUser!.uid.toString();
      product.updated_by_name = FirebaseAuth.instance.currentUser!.displayName??"";
      FirebaseFirestore.instance.collection(CONFIG.product_collection).doc(product.product_id).update(product.toMap());
    } else {
      product.created_at = DateTime.now().toUtc().toString();
      product.created_by = FirebaseAuth.instance.currentUser!.uid;
      product.created_by_name = FirebaseAuth.instance.currentUser!.displayName??"";
      FirebaseFirestore.instance.collection(CONFIG.product_collection)
          .add(product.toMap())
          .then((docRef) {
        FirebaseFirestore.instance.collection(CONFIG.product_collection).doc(docRef.id).update(
            {"product_id": docRef.id});
        return true;
      }).catchError((e) {
        return false;
      });
    }
    return true;
  }

  Future<bool> delete(productId) async {
    FirebaseFirestore.instance.collection(CONFIG.product_collection).doc(productId).delete().catchError((e){
      return false;
    });
    return true;
    }

  }
