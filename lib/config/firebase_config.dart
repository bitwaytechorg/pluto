import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (kIsWeb) {
      // Web
      return const FirebaseOptions(
          apiKey: "AIzaSyBSdoz_4oCDLLpni8G4cFlAjGfpK2awrUk",
          authDomain: "mrs-jacked.firebaseapp.com",
          projectId: "mrs-jacked",
          storageBucket: "mrs-jacked.appspot.com",
          messagingSenderId: "487140142386",
          appId: "1:487140142386:web:abc0e525c892aa39193b2b",
          measurementId: "G-ZXDYBHKWV3"
      );
    } else if (Platform.isIOS || Platform.isMacOS) {
      // iOS and MacOS
      return const FirebaseOptions(
        appId: '1:324875829005:ios:19d5501e79fb8249ddfa44',
        apiKey: 'AIzaSyDQh0J-lcw1IaXc1UtV9cgbs6LDIiEJt8M',
        projectId: 'mrs-jacked',
        messagingSenderId: '487140142386',
        iosBundleId: 'com.mrsjackedonplants',
        storageBucket: "mrs-jacked.appspot.com",
      );
    } else {
      // Android
      return const FirebaseOptions(
        appId: '1:487140142386:android:21a6e47de17bb75b193b2b',
        apiKey: 'AIzaSyDQh0J-lcw1IaXc1UtV9cgbs6LDIiEJt8M',
        projectId: 'mrs-jacked',
        storageBucket: "mrs-jacked.appspot.com",
        messagingSenderId: '487140142386',
      );
    }
  }
}