import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/error/server_failure.dart';
import 'package:flutter_application_1/features/auth/data/model/login/login_model.dart';

abstract class AuthRepo {
  Future<Either<ServerFailure, LoginModel>> signIn({
    required String signInEmail,
    required String signInPassword,
  });
}
