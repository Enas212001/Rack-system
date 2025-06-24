part of 'login_cubit.dart';
sealed class LoginState extends Equatable{
  final bool rememberMe;
  const LoginState({this.rememberMe = false});

  @override
  List<Object> get props => [rememberMe];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginFailure extends LoginState {
  final String message;
  const LoginFailure({required this.message});
}

class LoginSuccess extends LoginState {
  final LoginModel user;
  const LoginSuccess({required this.user});
}

class LoginCheckboxChanged extends LoginState {
  const LoginCheckboxChanged({required super.rememberMe});
}
