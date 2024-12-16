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
    apiKey: 'AIzaSyDYhns6pbGSFUHTSqE8fcnWos7zkeD-AQQ',
    appId: '1:738076473689:web:2c0a0ab60251e481c17448',
    messagingSenderId: '738076473689',
    projectId: 'teamup-77dbd',
    authDomain: 'teamup-77dbd.firebaseapp.com',
    storageBucket: 'teamup-77dbd.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBAQiXCIICIp8Paj16P1wh98wy2fRntueU',
    appId: '1:738076473689:android:e0f19e130cf5fc5cc17448',
    messagingSenderId: '738076473689',
    projectId: 'teamup-77dbd',
    storageBucket: 'teamup-77dbd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDETCBjqIQ9IsqAHzzM38TbO-wBdB24AFY',
    appId: '1:738076473689:ios:a8a0cf30fea9fa47c17448',
    messagingSenderId: '738076473689',
    projectId: 'teamup-77dbd',
    storageBucket: 'teamup-77dbd.appspot.com',
    iosBundleId: 'com.example.teamUpp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDETCBjqIQ9IsqAHzzM38TbO-wBdB24AFY',
    appId: '1:738076473689:ios:29820b97754a1eeac17448',
    messagingSenderId: '738076473689',
    projectId: 'teamup-77dbd',
    storageBucket: 'teamup-77dbd.appspot.com',
    iosBundleId: 'com.example.teamUpp.RunnerTests',
  );
}