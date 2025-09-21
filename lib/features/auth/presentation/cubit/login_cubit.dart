import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/api/dio_consumer.dart';
import 'package:flutter_application_1/core/cache/cache_helper.dart';
import 'package:flutter_application_1/core/utils/api_key.dart';
import 'package:flutter_application_1/core/service/service_locator.dart';
import 'package:flutter_application_1/features/auth/data/model/login_model.dart';
import 'package:flutter_application_1/features/auth/data/repo/auth_repo.dart';
import 'package:flutter_application_1/features/auth/data/repo/auth_repo_impl.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial()) {
    emailController.addListener(handleEmailChange);
  }

  final AuthRepo authRepo = AuthRepoImpl(api: getIt.get<DioConsumer>());
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool rememberMe = false;

  final cache = getIt.get<CacheHelper>();

  void toggleRememberMe({required value}) {
    rememberMe = value;
    if (rememberMe) {
      getIt.get<CacheHelper>().saveData(
        key: ApiKey.email,
        value: emailController.text,
      );
      getIt.get<CacheHelper>().saveData(
        key: ApiKey.password,
        value: passwordController.text,
      );
      getIt.get<CacheHelper>().saveData(key: ApiKey.rememberMe, value: true);
    } else {
      getIt.get<CacheHelper>().removeData(key: ApiKey.email);
      getIt.get<CacheHelper>().removeData(key: ApiKey.password);
      getIt.get<CacheHelper>().saveData(key: ApiKey.rememberMe, value: false);
    }
    emit(LoginCheckboxChanged(rememberMe: rememberMe));
  }

  void loadRememberedCredentials() {
    final savedEmail = getIt.get<CacheHelper>().getData(key: ApiKey.email);
    final savedPassword = getIt.get<CacheHelper>().getData(
      key: ApiKey.password,
    );
    final savedRememberMe =
        getIt.get<CacheHelper>().getData(key: ApiKey.rememberMe) ?? false;
    if (savedEmail != null &&
        savedPassword != null &&
        savedRememberMe == true) {
      emailController.text = savedEmail;
      passwordController.text = savedPassword;
      rememberMe = false;
      emit(LoginCheckboxChanged(rememberMe: rememberMe));
    }
  }

  void handleEmailChange() {
    final currentEmail = emailController.text;
    final savedEmail = cache.getData(key: ApiKey.email);
    if (savedEmail != null && savedEmail != currentEmail) {
      passwordController.clear();
    }
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
          getIt.get<CacheHelper>().saveData(
            key: CacheKey.userHotelId,
            value: user.user!.hotelId ?? '',
          );
          getIt.get<CacheHelper>().saveData(
            key: CacheKey.userName,
            value: user.user!.name,
          );
        },
      );
    } catch (e) {
      emit(LoginFailure(message: e.toString()));
    }
  }

  Future<void> logout() async {
    emit(LogoutLoading()); // optional, in case you want a loading state

    try {
      // Clear all auth-related cache
      await cache.removeData(key: ApiKey.email);
      await cache.removeData(key: ApiKey.password);
      await cache.removeData(key: ApiKey.rememberMe);

      await cache.removeData(key: CacheKey.isLogin);
      await cache.removeData(key: CacheKey.isGuest);
      await cache.removeData(key: CacheKey.userHotelId);
      await cache.removeData(key: CacheKey.userName);

      // Reset controllers
      emailController.clear();
      passwordController.clear();
      rememberMe = false;

      emit(LogoutSuccess()); // back to initial state after logout
    } catch (e) {
      emit(LogoutFailure(message: 'Logout failed: ${e.toString()}'));
    }
  }
}
