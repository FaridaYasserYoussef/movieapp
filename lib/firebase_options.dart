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
    apiKey: 'AIzaSyCBgNXjyyoLS-Wo6CS-SMbdTyV96s-6fHk',
    appId: '1:55605306851:web:8f7b05ff70680b5376ecd6',
    messagingSenderId: '55605306851',
    projectId: 'movieapp-ac783',
    authDomain: 'movieapp-ac783.firebaseapp.com',
    storageBucket: 'movieapp-ac783.firebasestorage.app',
    measurementId: 'G-L8ZQPTXPCE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD7oYG_Rn_QU_707a3YBIeXdD5Av28uQZo',
    appId: '1:55605306851:android:d98ad264a4cad5ec76ecd6',
    messagingSenderId: '55605306851',
    projectId: 'movieapp-ac783',
    storageBucket: 'movieapp-ac783.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAhtHROEIxH58PywuRFlAOQy4E69U2zelQ',
    appId: '1:55605306851:ios:f7d1c773fb04e49376ecd6',
    messagingSenderId: '55605306851',
    projectId: 'movieapp-ac783',
    storageBucket: 'movieapp-ac783.firebasestorage.app',
    iosBundleId: 'com.example.movieapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAhtHROEIxH58PywuRFlAOQy4E69U2zelQ',
    appId: '1:55605306851:ios:f7d1c773fb04e49376ecd6',
    messagingSenderId: '55605306851',
    projectId: 'movieapp-ac783',
    storageBucket: 'movieapp-ac783.firebasestorage.app',
    iosBundleId: 'com.example.movieapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCBgNXjyyoLS-Wo6CS-SMbdTyV96s-6fHk',
    appId: '1:55605306851:web:70229ff2468585a976ecd6',
    messagingSenderId: '55605306851',
    projectId: 'movieapp-ac783',
    authDomain: 'movieapp-ac783.firebaseapp.com',
    storageBucket: 'movieapp-ac783.firebasestorage.app',
    measurementId: 'G-XKFHJXQLT4',
  );
}
