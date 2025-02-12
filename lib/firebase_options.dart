// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB7xWubii1yOprwYfRNNPP_XqQKxhB-2uc',
    appId: '1:993602598454:web:a498b4a1711eddd5110a97',
    messagingSenderId: '993602598454',
    projectId: 'onenote-39432',
    authDomain: 'onenote-39432.firebaseapp.com',
    storageBucket: 'onenote-39432.appspot.com',
    measurementId: 'G-TNJ87SB566',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBxFc6yIPr47tdW_go8vjpCGLWFXB5sRWM',
    appId: '1:993602598454:android:6700f5a2face962d110a97',
    messagingSenderId: '993602598454',
    projectId: 'onenote-39432',
    storageBucket: 'onenote-39432.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyClpPHEUodx-9ryffyJWBMinnWEbbq_quE',
    appId: '1:993602598454:ios:db4f8a9fb562139d110a97',
    messagingSenderId: '993602598454',
    projectId: 'onenote-39432',
    storageBucket: 'onenote-39432.appspot.com',
    iosBundleId: 'com.example.oneNote',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyClpPHEUodx-9ryffyJWBMinnWEbbq_quE',
    appId: '1:993602598454:ios:db4f8a9fb562139d110a97',
    messagingSenderId: '993602598454',
    projectId: 'onenote-39432',
    storageBucket: 'onenote-39432.appspot.com',
    iosBundleId: 'com.example.oneNote',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB7xWubii1yOprwYfRNNPP_XqQKxhB-2uc',
    appId: '1:993602598454:web:005032c218b6816f110a97',
    messagingSenderId: '993602598454',
    projectId: 'onenote-39432',
    authDomain: 'onenote-39432.firebaseapp.com',
    storageBucket: 'onenote-39432.appspot.com',
    measurementId: 'G-X2JW3185ZS',
  );
}
