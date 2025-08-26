import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/api/dio_consumer.dart';
import 'package:flutter_application_1/core/utils/service_locator.dart';
import 'package:flutter_application_1/features/users/data/models/user_model/user_item.dart';
import 'package:flutter_application_1/features/users/data/repo/user_repo.dart';
import 'package:flutter_application_1/features/users/data/repo/user_repo_impl.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  final UserRepo userRepo = UserRepoImpl(api: getIt.get<DioConsumer>());
  Future<void> getUsersInfo() async {
    emit(UserLoading());
    final result = await userRepo.getUsersInfo();
    result.fold(
      (failure) => emit(UserError(message: failure.failure.errorMessage)),
      (userModel) {
        filteredUsers = userModel;
        emit(UserSuccess(userModel: userModel));
        
      },
    );
  }

  List<UserItem> filteredUsers = [];
  void searchUser(String query) {
    if (state is! UserSuccess) return;
    if (query.isEmpty) {
      emit(UserSuccess(userModel: filteredUsers));
      return;
    }
    final filtered = filteredUsers.where((user) {
      final name = user.name?.toLowerCase() ?? '';
      return name.contains(query.toLowerCase());
    }).toList();
    emit(UserSuccess(userModel: filtered));
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController roleIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Future<void> addUsersInfo() async {
    emit(UserAddLoading());
    final result = await userRepo.addUsersInfo(
      name: nameController.text,
      email: emailController.text,
      roleId: roleIdController.text,
      password: passwordController.text,
    );
    result.fold(
      (failure) => emit(UserAddError(message: failure.failure.errorMessage)),
      (userModel) => emit(UserAddSuccess(userModel: userModel)),
    );
  }

  Future<void> deleteUsersInfo({required String userId}) async {
    emit(UserDeleteLoading());
    final result = await userRepo.deleteUsersInfo(userId: userId);
    result.fold(
      (failure) => emit(UserDeleteError(message: failure.failure.errorMessage)),
      (message) => emit(UserDeleteSuccess(message: message)),
    );
  }
}
