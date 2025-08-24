import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/error/server_failure.dart';
import 'package:flutter_application_1/features/users/data/models/user_model/user_item.dart';

abstract class UserRepo {
  Future<Either<ServerFailure, List<UserItem>>> getUsersInfo();
  Future<Either<ServerFailure, UserItem>> addUsersInfo({
    required String name,
    required String email,
    required String roleId,
    required String password,
  });
  Future<Either<ServerFailure, String>> deleteUsersInfo({
    required String userId,
  });
}
