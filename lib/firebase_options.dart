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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAMzlj8F57qQ6HdWJ718BR78q2Sn80ht_4',
    appId: '1:257673925904:web:53ec09f32bd38542d30195',
    messagingSenderId: '257673925904',
    projectId: 'bookstore-d2134',
    authDomain: 'bookstore-d2134.firebaseapp.com',
    storageBucket: 'bookstore-d2134.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAUOI8x0cy9Wg0XZS7rGXUMgNkpir4pZUg',
    appId: '1:257673925904:android:5b3036b974d10a02d30195',
    messagingSenderId: '257673925904',
    projectId: 'bookstore-d2134',
    storageBucket: 'bookstore-d2134.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB5ahtoqOiaWLU3l8ootsArd8POjogcwes',
    appId: '1:257673925904:ios:343b255737539d54d30195',
    messagingSenderId: '257673925904',
    projectId: 'bookstore-d2134',
    storageBucket: 'bookstore-d2134.appspot.com',
    iosClientId: '257673925904-mbis2ek8de08prdf1t41033ja3bl47cb.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterGeneral',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB5ahtoqOiaWLU3l8ootsArd8POjogcwes',
    appId: '1:257673925904:ios:343b255737539d54d30195',
    messagingSenderId: '257673925904',
    projectId: 'bookstore-d2134',
    storageBucket: 'bookstore-d2134.appspot.com',
    iosClientId: '257673925904-mbis2ek8de08prdf1t41033ja3bl47cb.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterGeneral',
  );
}