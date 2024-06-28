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
    apiKey: 'AIzaSyDlq_eqfERPIrZZXn_3oeNvvBiWBbdiyUo',
    appId: '1:1085040357120:web:7b47df6980877984908de5',
    messagingSenderId: '1085040357120',
    projectId: 'signinauthapp-69810',
    authDomain: 'signinauthapp-69810.firebaseapp.com',
    storageBucket: 'signinauthapp-69810.appspot.com',
    measurementId: 'G-R7VBZ8K13Y',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA3Uzwep-gL4XAWw4SKkPc0fliPUjwZSZk',
    appId: '1:1085040357120:android:3ca0f8484ae963c6908de5',
    messagingSenderId: '1085040357120',
    projectId: 'signinauthapp-69810',
    storageBucket: 'signinauthapp-69810.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDfAFrYXDr-T7DLMEQv5m5KSW4GEc4JLOo',
    appId: '1:1085040357120:ios:0b102a4af0b407ba908de5',
    messagingSenderId: '1085040357120',
    projectId: 'signinauthapp-69810',
    storageBucket: 'signinauthapp-69810.appspot.com',
    iosClientId:
        '1085040357120-3pokerblet21h6anj7c4cu8pvpeup538.apps.googleusercontent.com',
    iosBundleId: 'com.example.signinGoogleAuth',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDfAFrYXDr-T7DLMEQv5m5KSW4GEc4JLOo',
    appId: '1:1085040357120:ios:0b102a4af0b407ba908de5',
    messagingSenderId: '1085040357120',
    projectId: 'signinauthapp-69810',
    storageBucket: 'signinauthapp-69810.appspot.com',
    iosClientId:
        '1085040357120-3pokerblet21h6anj7c4cu8pvpeup538.apps.googleusercontent.com',
    iosBundleId: 'com.example.signinGoogleAuth',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDlq_eqfERPIrZZXn_3oeNvvBiWBbdiyUo',
    appId: '1:1085040357120:web:1c0419ad2ca82475908de5',
    messagingSenderId: '1085040357120',
    projectId: 'signinauthapp-69810',
    authDomain: 'signinauthapp-69810.firebaseapp.com',
    storageBucket: 'signinauthapp-69810.appspot.com',
    measurementId: 'G-4WBPNVEQ9V',
  );
}
