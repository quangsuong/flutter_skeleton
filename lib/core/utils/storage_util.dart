import 'package:flutter_skeleton/core/constants/shared_pref_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../di/locator.dart';

class StorageUtil {
  static final SharedPreferences _sharedPreferences =
      ServiceLocator.instance.get<SharedPreferences>();

  static void setAccessTokenToLocalStorage(String accessToken) {
    _sharedPreferences.setString(
        SharedPreferenceKey.accessTokenKey, accessToken);
  }

  static void setRefreshTokenToLocalStorage(String refreshToken) {
    _sharedPreferences.setString(
        SharedPreferenceKey.refreshTokenKey, refreshToken);
  }

  static String getAccessTokenFromLocalStorage() {
    return _sharedPreferences.getString(SharedPreferenceKey.accessTokenKey) ??
        '';
  }

  static String getRefreshTokenFromLocalStorage() {
    return _sharedPreferences.getString(SharedPreferenceKey.refreshTokenKey) ??
        '';
  }

  static bool loadTheme() {
    final isDarkMode =
        _sharedPreferences.getBool(SharedPreferenceKey.isDarkModeKey) ?? false;
    return isDarkMode;
  }

  static void saveTheme(bool isDarkMode) async {
    await _sharedPreferences.setBool(
        SharedPreferenceKey.isDarkModeKey, isDarkMode);
  }
}
