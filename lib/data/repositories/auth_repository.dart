import 'package:flutter_skeleton/core/services/login_service.dart';
import 'package:flutter_skeleton/data/models/api_response.dart';
import 'package:flutter_skeleton/data/models/login_model.dart';
import 'package:flutter_skeleton/data/models/user_model.dart';

class AuthRepository {
  final LoginService loginService = LoginService();

  Future<ApiResponse<UserModel>> login(LoginModel loginModel) async {
    return loginService.login(loginModel);
  }
}
