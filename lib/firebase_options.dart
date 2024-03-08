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
    apiKey: 'AIzaSyBBnjAyMN8Mk9O3RTmFWv3LCmfQzagSX1o',
    appId: '1:753785125549:web:c0c72906a228ca05a46424',
    messagingSenderId: '753785125549',
    projectId: 'kayla-testapp',
    authDomain: 'kayla-testapp.firebaseapp.com',
    databaseURL: 'https://kayla-testapp-default-rtdb.firebaseio.com',
    storageBucket: 'kayla-testapp.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDkGdxYXRpOI58OYgGZ3oa9rx2_6ykFk00',
    appId: '1:753785125549:android:8a8cf5b6b1a62913a46424',
    messagingSenderId: '753785125549',
    projectId: 'kayla-testapp',
    databaseURL: 'https://kayla-testapp-default-rtdb.firebaseio.com',
    storageBucket: 'kayla-testapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDNT3KrgRymFguHBRm_ts1Wd81lbpGPgaU',
    appId: '1:753785125549:ios:f617593d1ecba679a46424',
    messagingSenderId: '753785125549',
    projectId: 'kayla-testapp',
    databaseURL: 'https://kayla-testapp-default-rtdb.firebaseio.com',
    storageBucket: 'kayla-testapp.appspot.com',
    androidClientId: '753785125549-2gchr85inep8amivalcd1ucskma6jitg.apps.googleusercontent.com',
    iosClientId: '753785125549-kqig3oo5fk9k1o81b31be9ocmkh1nfoa.apps.googleusercontent.com',
    iosBundleId: 'com.example.assignment',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDNT3KrgRymFguHBRm_ts1Wd81lbpGPgaU',
    appId: '1:753785125549:ios:21a54c530a5543d0a46424',
    messagingSenderId: '753785125549',
    projectId: 'kayla-testapp',
    databaseURL: 'https://kayla-testapp-default-rtdb.firebaseio.com',
    storageBucket: 'kayla-testapp.appspot.com',
    androidClientId: '753785125549-2gchr85inep8amivalcd1ucskma6jitg.apps.googleusercontent.com',
    iosClientId: '753785125549-k6rqltpmvaq537rhut8ucdfl0cqlp56h.apps.googleusercontent.com',
    iosBundleId: 'com.example.assignment.RunnerTests',
  );
}
