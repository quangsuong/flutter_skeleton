
import 'package:flutter/foundation.dart';

class PrintHelper {
  static printHelper(String message) {
    if (kDebugMode) {
      print(message);
    }
  }
}