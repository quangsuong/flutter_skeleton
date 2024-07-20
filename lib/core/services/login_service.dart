import 'package:flutter_skeleton/data/models/login_model.dart';

import '../../data/models/api_response.dart';
import '../../data/models/refresh_response.dart';
import '../../data/models/user_model.dart';
import 'network/base_service.dart';

class LoginService extends BaseService {
  Future<ApiResponse<UserModel>> login(LoginModel loginModel) async {
    try {
      return await post(
          '/login', loginModel.toJson(), (json) => UserModel.fromJson(json));
    } catch (e) {
      throw Exception('Failed to load items: $e');
    }
  }

  Future<ApiResponse<RefreshResponse>> refreshToken(String refreshToken) async {
    try {
      return await post(
          '/refresh_token',
          RefreshResponse(refreshToken: refreshToken).toJson(),
          (json) => RefreshResponse.fromJson(json));
    } catch (e) {
      throw Exception('Failed to load items: $e');
    }
  }
}
