import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) return web;

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBf7TpAjbDmzgw81RjgP8FTe03NzdC14jU',
    appId: '1:814084149906:web:cafb5d4ac3b68f39474c4b',
    messagingSenderId: '814084149906',
    projectId: 'studio-2331444950-20a90',
    authDomain: 'studio-2331444950-20a90.firebaseapp.com',
    storageBucket: 'studio-2331444950-20a90.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDxhroPq9SX3qPhi3R0HqQLxI1Wh_vpyZI',
    appId: '1:814084149906:android:ccbbdd9fe93856e7474c4b',
    messagingSenderId: '814084149906',
    projectId: 'studio-2331444950-20a90',
    storageBucket: 'studio-2331444950-20a90.firebasestorage.app',
  );
}
