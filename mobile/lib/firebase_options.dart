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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDdCSq7W4Akjou4GRO4dqotNgPiBgHv-6Q',
    appId: '1:1092130102248:web:2a07a2d15a03bbfc30e25d',
    messagingSenderId: '1092130102248',
    projectId: 'quizapp-8da59',
    authDomain: 'quizapp-8da59.firebaseapp.com',
    storageBucket: 'quizapp-8da59.appspot.com',
    measurementId: 'G-HRYC4CN112',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCZqJvgwb6hbSNcAGLQFiNwjAVqEwBU9pU',
    appId: '1:1092130102248:android:fb266134c583331f30e25d',
    messagingSenderId: '1092130102248',
    projectId: 'quizapp-8da59',
    storageBucket: 'quizapp-8da59.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD0ZqXNatB_XaQhVgi__uPYJCop9Xnfmak',
    appId: '1:1092130102248:ios:360f13004f135d5630e25d',
    messagingSenderId: '1092130102248',
    projectId: 'quizapp-8da59',
    storageBucket: 'quizapp-8da59.appspot.com',
    iosBundleId: 'com.example.quizapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDdCSq7W4Akjou4GRO4dqotNgPiBgHv-6Q',
    appId: '1:1092130102248:web:200027e47d243e7c30e25d',
    messagingSenderId: '1092130102248',
    projectId: 'quizapp-8da59',
    authDomain: 'quizapp-8da59.firebaseapp.com',
    storageBucket: 'quizapp-8da59.appspot.com',
    measurementId: 'G-M6YRBDM2B0',
  );
}
