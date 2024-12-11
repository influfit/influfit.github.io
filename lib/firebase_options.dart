import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    // Add other platforms if needed
    return web;
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCkgqiDI7Aw_Y2cVEnzv-0m3a-IZusIMDc',
    appId: '1:605481427202:web:1d154fd999c8e438c8e21b',
    messagingSenderId: '605481427202',
    projectId: 'influfitweb',
    authDomain: 'influfitweb.firebaseapp.com',
    storageBucket: 'influfitweb.firebasestorage.app',
    measurementId: 'G-CYNWBBPHCC',
  );
}
