import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/api/api_consumer.dart';
import 'package:flutter_application_1/core/cache/cache_helper.dart';
import 'package:flutter_application_1/core/error/server_failure.dart';
import 'package:flutter_application_1/core/utils/api_key.dart';
import 'package:flutter_application_1/core/service/service_locator.dart';
import 'package:flutter_application_1/features/auth/data/model/login_model.dart';

import 'auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiConsumer api;

  AuthRepoImpl({required this.api});

  @override
  Future<Either<ServerFailure, LoginModel>> signIn({
    required String signInEmail,
    required String signInPassword,
  }) async {
    try {
      final response = await api.post(
        Endpoints.login,
        data: {ApiKey.email: signInEmail, ApiKey.password: signInPassword},
      );
      final user = LoginModel.fromJson(response);
      getIt.get<CacheHelper>().saveData(
        key: ApiKey.loginName,
        value: user.user!.name,
      );
      getIt.get<CacheHelper>().saveData(
        key: ApiKey.roleId,
        value: user.user!.roleId,
      );
      return right(user);
    } on ServerFailure catch (e) {
      return left(e);
    }
  }
}
