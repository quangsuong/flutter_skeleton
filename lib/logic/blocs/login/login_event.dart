part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginRequested extends LoginEvent {
  final LoginModel loginModel;
  const LoginRequested(this.loginModel);

  @override
  List<Object> get props => [loginModel];
}
