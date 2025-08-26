import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/api/api_consumer.dart';
import 'package:flutter_application_1/core/error/server_failure.dart';
import 'package:flutter_application_1/core/utils/api_key.dart';
import 'package:flutter_application_1/features/users/data/models/user_model/user_item.dart';
import 'package:flutter_application_1/features/users/data/repo/user_repo.dart';

class UserRepoImpl implements UserRepo {
  final ApiConsumer api;

  UserRepoImpl({required this.api});
  @override
  Future<Either<ServerFailure, UserItem>> addUsersInfo({
    required String name,
    required String email,
    required String roleId,
    required String password,
  }) async {
    try {
      final response = await api.post(
        Endpoints.addUser,
        data: {
          ApiKey.name: name,
          ApiKey.email: email,
          ApiKey.roleId: roleId,
          ApiKey.password: password,
        },
      );
      if (response['status'] == 'success') {
        return right(UserItem.fromJson(response['data']));
      } else {
        // Treat as failure
        return left(
          ServerFailure(
            failure: FailureModel(
              status: 'false',
              errorMessage: response['message'] ?? 'Unknown error',
            ),
          ),
        );
      }
    } catch (e) {
      return Left(
        ServerFailure(
          failure: FailureModel(status: 'false', errorMessage: e.toString()),
        ),
      );
    }
  }

  @override
  Future<Either<ServerFailure, String>> deleteUsersInfo({
    required String userId,
  }) async {
    try {
      final response = await api.delete(Endpoints.deleteUser(userId));
      return Right(response['message']);
    } catch (e) {
      return Left(
        ServerFailure(
          failure: FailureModel(status: 'false', errorMessage: e.toString()),
        ),
      );
    }
  }

  @override
  Future<Either<ServerFailure, List<UserItem>>> getUsersInfo() async {
    try {
      final response = await api.get(Endpoints.getUsers);
      final List<dynamic> data = response['data'];
      final users = data
          .map((e) => UserItem.fromJson(e as Map<String, dynamic>))
          .toList();
      return right(users);
    } on ServerFailure catch (e) {
      return left(e);
    }
  }
}
