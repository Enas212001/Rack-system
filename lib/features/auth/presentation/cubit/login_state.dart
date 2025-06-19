part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginFailure extends LoginState {
  final String message;
  const LoginFailure({required this.message});
}

final class LoginSuccess extends LoginState {
  final LoginModel user;
  const LoginSuccess({required this.user});

  @override
  List<Object> get props => [user];
}

class LoginCheckboxChanged extends LoginState {
  final bool rememberMe;
  const LoginCheckboxChanged({required this.rememberMe});
}

final class LoginLoading extends LoginState {}
