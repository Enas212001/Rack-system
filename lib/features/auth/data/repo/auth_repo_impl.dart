// import 'package:dartz/dartz.dart';
// import 'package:flutter_application_1/core/api/api_consumer.dart';
// import 'package:flutter_application_1/core/error/server_failure.dart';
// import 'package:flutter_application_1/features/auth/data/model/login_model.dart';

// import 'auth_repo.dart';

// class AuthRepoImpl extends AuthRepo {
//   final ApiConsumer api;

//   AuthRepoImpl({required this.api});

//   @override
//   Future<Either<ServerFailure, Login>> signIn({
//     required String signInEmail,
//     required String signInPassword,
//   }) async {
//     try {
//       final response = await api.post(
//         'EndPoint.login',
//         data: {'ApiKey.email': signInEmail, 'ApiKey.password': signInPassword},
//       );
//       // final user = Login.fromJson(response);
//       final user = Login;
//       return right(user as Login);
//     } on ServerFailure catch (e) {
//       return left(e);
//     }
//   }

// }
