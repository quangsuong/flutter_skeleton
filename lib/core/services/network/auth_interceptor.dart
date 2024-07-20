import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_skeleton/core/constants/language.dart';
import 'package:flutter_skeleton/core/constants/shared_pref_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/zozo_app.dart';
import '../../di/locator.dart';
import '../../utils/log_util.dart';
import '../../utils/storage_util.dart';
import '../login_service.dart';

class AuthInterceptor extends Interceptor {
  final Dio _dio;
  AuthInterceptor(this._dio);

  bool _isRefreshing = false;
  final _requestsNeedRetry =
      <({RequestOptions options, ErrorInterceptorHandler handler})>[];

  SharedPreferences sharedPreferences =
      ServiceLocator.instance.get<SharedPreferences>();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // Add the Authorization header to the request
    final headers = await initHeader();
    options.headers.addAll(headers);
    final accessToken = StorageUtil.getAccessTokenFromLocalStorage();
    options.headers['authorization'] = 'Bearer $accessToken';
    return handler.next(options); // Continue with the request
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Handle 401 errors by refreshing the token and retrying the request
    final response = err.response;
    if (response != null &&
        // status code for unauthorized usually 401
        response.statusCode == 401 &&
        // refresh token call maybe fail by it self
        // eg: when refreshToken also is expired -> can't get new accessToken
        // usually server also return 401 unauthorized for this case
        // need to exlude it to prevent loop infinite call
        response.requestOptions.path != "path/your/endpoint/refresh") {
      // if hasn't not refreshing yet, let's start it
      if (!_isRefreshing) {
        _isRefreshing = true;

        // add request (requestOptions and handler) to queue and wait to retry later
        _requestsNeedRetry
            .add((options: response.requestOptions, handler: handler));

        // call api refresh token
        final isRefreshSuccess = await _refreshToken();

        if (isRefreshSuccess) {
          // refresh success, loop requests need retry
          for (var requestNeedRetry in _requestsNeedRetry) {
            // don't need set new accessToken to header here, because these retry
            // will go through onRequest callback above (where new accessToken will be set to header)

            // won't use await because this loop will take longer -> maybe throw: Unhandled Exception: Concurrent modification during iteration
            // because method _requestsNeedRetry.add() is called at the same time
            // final response = await dio.fetch(requestNeedRetry.options);
            // requestNeedRetry.handler.resolve(response);

            _dio.fetch(requestNeedRetry.options).then((response) {
              requestNeedRetry.handler.resolve(response);
            }).catchError((_) {});
          }

          _requestsNeedRetry.clear();
          _isRefreshing = false;
        } else {
          _requestsNeedRetry.clear();
          // if refresh fail, force logout user here
        }
      } else {
        // if refresh flow is processing, add this request to queue and wait to retry later
        _requestsNeedRetry
            .add((options: response.requestOptions, handler: handler));
      }
    } else {
      // ignore other error is not unauthorized
      return handler.next(err);
    }
  }

  Future<bool> _refreshToken() async {
    try {
      final refreshToken = StorageUtil.getRefreshTokenFromLocalStorage();
      final LoginService loginService = LoginService();
      final response = await loginService.refreshToken(refreshToken);
      if (response.success) {
        LogUtil.logInfo("refresh token success");
        // save new access + refresh token to your local storage for using later
        StorageUtil.setAccessTokenToLocalStorage(response.data.accessToken);
        StorageUtil.setRefreshTokenToLocalStorage(response.data.refreshToken);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      LogUtil.logError('Failed to refresh token: $e');
      return false;
    }
  }

  Future<Response> callApiRefreshToken(String refreshToken) async {
    // Implement the API call for refreshing the token here
    // This is a placeholder and should be replaced with actual API call
    return await _dio.post('path/your/endpoint/refresh',
        data: {'refreshToken': refreshToken});
  }

  Future<Map<String, String>> initHeader() async {
    Map<String, String> headers = {};
    if (!sharedPreferences.containsKey(SharedPreferenceKey.deviceNameKey)) {
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
