import 'dart:io';

import 'package:dio/dio.dart';

import '../../constants/zozo_app.dart';

class AuthInterceptor extends Interceptor {
  final Dio _dio;
  String? _accessToken;
  String? _refreshToken;
  Map<String, String>? _headers;

  AuthInterceptor(this._dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // Add the Authorization header to the request
    if (_headers == null) {
      _headers = {};
      var zozoApp = ZozoApp();
      var deviceInfo = await zozoApp.getDeviceInfo();
      _headers!['Device-name'] = deviceInfo[Platform.isIOS ? 'name' : 'model'];
      _headers!['Device-id'] =
          deviceInfo[Platform.isIOS ? 'identifierForVendor' : 'id'];
      _headers!['Device-OS'] =
          deviceInfo[Platform.isIOS ? 'systemName' : 'version.baseOS'];
      _headers!['Device-version'] =
          deviceInfo[Platform.isIOS ? 'systemVersion' : 'version.release'];
    }
    options.headers.addAll(_headers ?? {});
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
}
