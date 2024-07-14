import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../data/models/api_response.dart';
import '../../constants/constants.dart';
import '../../constants/env.dart';
import 'auth_interceptor.dart';

class BaseService<T> {
  final Dio _dio;

  BaseService()
      : _dio = Dio(BaseOptions(
          baseUrl: Env.baseUrl,
          connectTimeout: const Duration(seconds: REQUEST_TIMEOUT),
          receiveTimeout: const Duration(seconds: REQUEST_TIMEOUT),
        )) {
    _dio.interceptors.add(AuthInterceptor(_dio));
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));
  }

  Future<ApiResponse<T>> get(
      String endpoint, T Function(Map<String, dynamic>) create) async {
    try {
      final response = await _dio.get(endpoint);
      return ApiResponse.fromJson(response.data, create);
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }

  Future<ApiResponse<T>> post(String endpoint, Map<String, dynamic> data,
      T Function(Map<String, dynamic>) create) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return ApiResponse.fromJson(response.data, create);
    } catch (e) {
      throw Exception('Failed to post data: $e');
    }
  }

// Additional common methods for POST, PUT, DELETE can be added here
}
