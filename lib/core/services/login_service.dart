import 'package:flutter_skeleton/data/models/login_model.dart';

import '../../data/models/api_response.dart';
import '../../data/models/user_model.dart';
import 'network/base_service.dart';

class LoginService extends BaseService<UserModel> {
  Future<ApiResponse<UserModel>> login(LoginModel loginModel) async {
    try {
      return await post(
          '/login', loginModel.toJson(), (json) => UserModel.fromJson(json));
    } catch (e) {
      throw Exception('Failed to load items: $e');
    }
  }
}
