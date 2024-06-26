class Env {
  static const name = String.fromEnvironment('NAME');
  static const baseUrl = String.fromEnvironment('BASE_URL');
  static const firebaseAndroidApiKey =
      String.fromEnvironment('FIREBASE_ANDROID_API_KEY');
  static const firebaseIosApiKey =
      String.fromEnvironment('FIREBASE_IOS_API_KEY');
  static const firebaseAndroidAppId =
      String.fromEnvironment('FIREBASE_ANDROID_APP_ID');
  static const firebaseIosAppId = String.fromEnvironment('FIREBASE_IOS_APP_ID');
  static const firebaseMessageSenderId =
      String.fromEnvironment('FIREBASE_MESSAGING_SENDER_ID');
  static const firebaseProjectId =
      String.fromEnvironment('FIREBASE_PROJECT_ID');
  static const firebaseStorageBucket =
      String.fromEnvironment('FIREBASE_STORAGE_BUCKET');
  static const firebaseIosClientId =
      String.fromEnvironment('FIREBASE_IOS_CLIENT_ID');
  static const firebaseIosBundleId =
      String.fromEnvironment('FIREBASE_IOS_BUNDLE_ID');
}

class Envs {
  static const DEV = 'DEV';
  static const STAGING = 'STAGING';
  static const PRODUCTION = 'PRODUCTION';
}
