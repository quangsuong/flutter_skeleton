import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/core/utils/bloc_extensions.dart';
import 'package:flutter_skeleton/data/models/api_response.dart';
import 'package:flutter_skeleton/data/models/login_model.dart';

import '../../../core/di/locator.dart';
import '../../../data/models/user_model.dart';
import '../../../data/repositories/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginRequested, LoginState> {
  final AuthRepository _authRepository =
      ServiceLocator.instance.get<AuthRepository>();
  LoginBloc() : super(LoginInitial()) {
    on<LoginRequested>(login);
  }

  void login(LoginRequested event, Emitter<LoginState> emit) async {
    emitSafely(LoginLoading());
    try {
      final userModel = await _authRepository.login(event.loginModel);
      emitSafely(LoginSuccess(userModel: userModel));
    } catch (e) {
      emitSafely(const LoginFailure(message: 'Failed to login'));
    }
  }
}
