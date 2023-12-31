// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBALpziRZXjwp-jVUINInFJXoOEfauBQF4',
    appId: '1:137927868263:android:28fdbfcdae284dcbd639c2',
    messagingSenderId: '137927868263',
    projectId: 'food-delivery-40493',
    storageBucket: 'food-delivery-40493.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBVI8aaS5vge2Hhyuluuzu_M5owdFMwR-c',
    appId: '1:137927868263:ios:8e446781b908a79fd639c2',
    messagingSenderId: '137927868263',
    projectId: 'food-delivery-40493',
    storageBucket: 'food-delivery-40493.appspot.com',
    androidClientId: '137927868263-l9hsvtelnmhr1fgbqv5533traa2nicr3.apps.googleusercontent.com',
    iosClientId: '137927868263-7c1rnkdl9cg10d9cq0ef9m1nm42qgcgu.apps.googleusercontent.com',
    iosBundleId: 'com.example.foodDeliveryApp',
  );
}
