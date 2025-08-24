part of 'user_cubit.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserSuccess extends UserState {
  final List<UserItem> userModel;
  const UserSuccess({required this.userModel});
  @override
  List<Object> get props => [userModel];
}

final class UserError extends UserState {
  final String message;
  const UserError({required this.message});
}

final class UserAddLoading extends UserState {}

final class UserAddSuccess extends UserState {
  final UserItem userModel;
  const UserAddSuccess({required this.userModel});
}

final class UserAddError extends UserState {
  final String message;
  const UserAddError({required this.message});
}

final class UserDeleteLoading extends UserState {}

final class UserDeleteSuccess extends UserState {
  final String message;
  const UserDeleteSuccess({required this.message});
}

final class UserDeleteError extends UserState {
  final String message;
  const UserDeleteError({required this.message});
}
