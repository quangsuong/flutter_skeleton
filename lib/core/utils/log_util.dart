import 'package:flutter/foundation.dart';

class LogUtil {
  static void logInfo(String message) {
    if (kDebugMode) {
      print('INFO: $message');
    }
  }

  static void logWarning(String message) {
    if (kDebugMode) {
      print('WARNING: $message');
    }
  }

  static void logError(String message) {
    if (kDebugMode) {
      print('ERROR: $message');
    }
  }
}
