import 'package:flutter_skeleton/data/models/login_model.dart';

import '../../../core/di/locator.dart';
import '../../../logic/blocs/login/login_bloc.dart';

class LoginViewModel {
  final LoginBloc loginBloc = ServiceLocator.instance.get<LoginBloc>();

  void login(LoginModel loginModel) {
    loginBloc.add(LoginRequested(loginModel));
  }
}
