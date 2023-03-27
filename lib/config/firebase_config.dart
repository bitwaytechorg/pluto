import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (kIsWeb) {
      // Web
      return const FirebaseOptions(
          apiKey: "AIzaSyBKe2ZBv4FZWju7m13TdA4QRDngpUQV01A",
          authDomain: "petsoll.firebaseapp.com",
          projectId: "petsoll",
          storageBucket: "petsoll.appspot.com",
          messagingSenderId: "378591221558",
          appId: "1:378591221558:web:fba275fa0cb16b0fa88597",
          measurementId: "G-4M0BSJ4FMQ"
      );
    } else if (Platform.isIOS || Platform.isMacOS) {
      // iOS and MacOS
      return const FirebaseOptions(
        appId: '1:378591221558:ios:f45282a00ab7d8e3a88597',
        apiKey: 'AIzaSyAmdcU2C5AeUVBGXSpV_EgAmxirpl1X3ic',
        projectId: 'petsoll',
        messagingSenderId: '378591221558',
        iosBundleId: 'com.bitwaytech.petsoll.ios',
        storageBucket: "petsoll.appspot.com",
      );
    } else {
      // Android
      return const FirebaseOptions(
        appId: '1:378591221558:android:2564f2fdf30d44e7a88597',
        apiKey: 'AIzaSyCzzIgrjsXz7Q4DV26jbeEi5ZX5lYMWCQU',
        projectId: 'petsoll',
        storageBucket: "petsoll.appspot.com",
        messagingSenderId: '378591221558',
      );
    }
  }
}