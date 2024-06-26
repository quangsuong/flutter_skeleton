
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

import 'constants/env.dart';

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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: Env.firebaseAndroidApiKey,
    appId: Env.firebaseAndroidAppId,
    messagingSenderId: Env.firebaseMessageSenderId,
    projectId: Env.firebaseProjectId,
    storageBucket: Env.firebaseStorageBucket,
  );


  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: Env.firebaseIosApiKey,
    appId: Env.firebaseIosAppId,
    messagingSenderId: Env.firebaseMessageSenderId,
    projectId: Env.firebaseProjectId,
    storageBucket: Env.firebaseStorageBucket,
    iosClientId: Env.firebaseIosClientId,
    iosBundleId: Env.firebaseIosBundleId,
  );
}
