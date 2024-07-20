import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_skeleton/core/constants/language.dart';
import 'package:flutter_skeleton/core/constants/shared_pref_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/zozo_app.dart';
import '../../di/locator.dart';

class AuthInterceptor extends Interceptor {
  final Dio _dio;
  String? _accessToken;
  String? _refreshToken;
  SharedPreferences sharedPreferences =
      ServiceLocator.instance.get<SharedPreferences>();

  AuthInterceptor(this._dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // Add the Authorization header to the request
    var headers = await initHeader();
    options.headers.addAll(headers);
    options.headers['Authorization'] = 'Bearer $_accessToken';
    return handler.next(options); // Continue with the request
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Handle 401 errors by refreshing the token and retrying the request
    if (err.response?.statusCode == 401) {
      // Assume refresh token logic is implemented here
      final newToken = await refreshToken();
      if (newToken != null) {
        _accessToken = newToken;

        // Clone the original request with the new access token
        final opts = Options(
          method: err.requestOptions.method,
          headers: err.requestOptions.headers,
        );
        opts.headers?['Authorization'] = 'Bearer $_accessToken';

        try {
          final cloneReq = await _dio.request(
            err.requestOptions.path,
            options: opts,
            data: err.requestOptions.data,
            queryParameters: err.requestOptions.queryParameters,
          );
          return handler.resolve(cloneReq); // Continue with the new request
        } catch (e) {
          return handler.reject(e as DioException); // Reject with the new error
        }
      }
    }
    return handler.next(err); // Continue with the error
  }

  Future<String?> refreshToken() async {
    try {
      final response = await _dio.post('/auth/refresh', data: {
        'refresh_token': _refreshToken,
      });
      return response.data['access_token'];
    } catch (e) {
      print('Failed to refresh token: $e');
      return null;
    }
  }

  Future<Map<String, String>> initHeader() async {
    Map<String, String> headers = {};
    if (sharedPreferences.containsKey(SharedPreferenceKey.deviceNameKey)) {
      var zozoApp = ZozoApp();
      var deviceInfo = await zozoApp.getDeviceInfo();
      var deviceName = deviceInfo[Platform.isIOS ? 'name' : 'model'];
      var deviceId = deviceInfo[Platform.isIOS ? 'identifierForVendor' : 'id'];
      var deviceOs =
          deviceInfo[Platform.isIOS ? 'systemName' : 'version.baseOS'];
      var deviceVersion =
          deviceInfo[Platform.isIOS ? 'systemVersion' : 'version.release'];
      var languageCode =
          sharedPreferences.getString(SharedPreferenceKey.langCode) ??
              MyLanguages.en;
      sharedPreferences.setString(
          SharedPreferenceKey.deviceNameKey, deviceName);
      sharedPreferences.setString(SharedPreferenceKey.deviceIdKey, deviceId);
      sharedPreferences.setString(SharedPreferenceKey.deviceOSKey, deviceOs);
      sharedPreferences.setString(
          SharedPreferenceKey.deviceVersionKey, deviceVersion);
      return {
        'Device-name': deviceName,
        'Device-id': deviceId,
        'Device-OS': deviceOs,
        'Device-version': deviceVersion,
        'Language-code': languageCode
      };
    }
    headers['Device-name'] =
        sharedPreferences.getString(SharedPreferenceKey.deviceNameKey) ?? '';
    headers['Device-id'] =
        sharedPreferences.getString(SharedPreferenceKey.deviceIdKey) ?? '';
    headers['Device-OS'] =
        sharedPreferences.getString(SharedPreferenceKey.deviceOSKey) ?? '';
    headers['Device-version'] =
        sharedPreferences.getString(SharedPreferenceKey.deviceVersionKey) ?? '';
    headers['Language-code'] =
        sharedPreferences.getString(SharedPreferenceKey.langCode) ??
            MyLanguages.en;
    return headers;
  }
}
