import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/api/dio_consumer.dart';
import 'package:flutter_application_1/core/cache/cache_helper.dart';
import 'package:flutter_application_1/core/utils/api_key.dart';
import 'package:flutter_application_1/core/utils/service_locator.dart';
import 'package:flutter_application_1/features/auth/data/model/login/login_model.dart';
import 'package:flutter_application_1/features/auth/data/repo/auth_repo.dart';
import 'package:flutter_application_1/features/auth/data/repo/auth_repo_impl.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final AuthRepo authRepo = AuthRepoImpl(api: getIt.get<DioConsumer>());
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool rememberMe = false; // ✅ add this

  final cache = getIt.get<CacheHelper>();
  void toggleRememberMe({required bool value}) {
    rememberMe = value;
    if (rememberMe) {
      List<String> emailList = List<String>.from(
        cache.getData(key: ApiKey.emailList) ?? [],
      );
      if (!emailList.contains(emailController.text)) {
        emailList.add(emailController.text);
        cache.saveData(key: ApiKey.emailList, value: emailList);
      }
      final String? jsonString = getIt.get<CacheHelper>().getData(
        key: ApiKey.passwordsMap,
      );
      final Map<String, String> passwords = jsonString != null
          ? Map<String, String>.from(jsonDecode(jsonString))
          : {};
      passwords[emailController.text] = passwordController.text;
      cache.saveData(key: ApiKey.passwordsMap, value: passwords);
      cache.saveData(key: ApiKey.email, value: emailController.text);
      cache.saveData(key: ApiKey.rememberMe, value: true);
    } else {
      cache.removeData(key: ApiKey.email);
      cache.removeData(key: ApiKey.passwordsMap);
      cache.saveData(key: ApiKey.rememberMe, value: false);
    }
    emit(LoginCheckboxChanged(rememberMe: rememberMe));
  }

  List<String> emailSuggestions = [];

  void loadEmailSuggestions() {
    final list = getIt.get<CacheHelper>().getData(key: ApiKey.emailList);
    emailSuggestions = List<String>.from(list ?? []);
  }

  Future<void> login() async {
    emit(LoginLoading());
    try {
      final response = await authRepo.signIn(
        signInEmail: emailController.text,
        signInPassword: passwordController.text,
      );
      response.fold(
        (failure) => emit(LoginFailure(message: failure.failure.errorMessage)),
        (user) {
          emit(LoginSuccess(user: user));
          emailController.clear();
          passwordController.clear();
          rememberMe = false;
        },
      );
    } catch (e) {
      emit(LoginFailure(message: e.toString()));
    }
  }
}
