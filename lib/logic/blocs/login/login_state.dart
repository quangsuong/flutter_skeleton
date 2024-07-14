part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final ApiResponse<UserModel> userModel;

  const LoginSuccess({required this.userModel});

  @override
  List<Object> get props => [userModel];
}

class LoginFailure extends LoginState {
  final String message;
  const LoginFailure({required this.message});

  @override
  List<Object> get props => [message];
}
