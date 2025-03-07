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
    apiKey: 'AIzaSyBZMgnQAdacwbW1s_37zTKxKHI2jbFnWLI',
    appId: '1:302787420424:android:104bb3b4e24da323ccccbd',
    messagingSenderId: '302787420424',
    projectId: 'mynotes-hussain',
    databaseURL: 'https://mynotes-hussain-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'mynotes-hussain.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCpEpIjemD6mOln2Ng354M-Xp3u8F9bNGA',
    appId: '1:302787420424:ios:0ab9794fb38346f0ccccbd',
    messagingSenderId: '302787420424',
    projectId: 'mynotes-hussain',
    databaseURL: 'https://mynotes-hussain-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'mynotes-hussain.appspot.com',
    iosBundleId: 'com.example.mynotes',
  );
}
