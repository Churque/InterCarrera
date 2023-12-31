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
    apiKey: 'AIzaSyBl5_FluCtVhxjbxicWRG9Pz8hqDnjrmp0',
    appId: '1:212728282979:web:00d3bde0916b74fe58dd56',
    messagingSenderId: '212728282979',
    projectId: 'intercarrera-c35b0',
    authDomain: 'intercarrera-c35b0.firebaseapp.com',
    storageBucket: 'intercarrera-c35b0.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB_2oR-yldU1xfsuifXovu3_47Wwm49cPA',
    appId: '1:212728282979:android:edd2a5dbb129139358dd56',
    messagingSenderId: '212728282979',
    projectId: 'intercarrera-c35b0',
    storageBucket: 'intercarrera-c35b0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD38qLLKyaGpF1OdC261UvqEj--5yzPOPQ',
    appId: '1:212728282979:ios:f3e257e264b1bb8f58dd56',
    messagingSenderId: '212728282979',
    projectId: 'intercarrera-c35b0',
    storageBucket: 'intercarrera-c35b0.appspot.com',
    iosBundleId: 'com.example.kdksdkskdxd',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD38qLLKyaGpF1OdC261UvqEj--5yzPOPQ',
    appId: '1:212728282979:ios:b23e9b20f81a26dd58dd56',
    messagingSenderId: '212728282979',
    projectId: 'intercarrera-c35b0',
    storageBucket: 'intercarrera-c35b0.appspot.com',
    iosBundleId: 'com.example.kdksdkskdxd.RunnerTests',
  );
}
