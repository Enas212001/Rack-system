import 'package:dio/dio.dart';

class FailureModel {
  final String errorMessage;
  final String status;

  FailureModel({required this.errorMessage, required this.status});
  factory FailureModel.fromJson(Map<String, dynamic> json) {
    return FailureModel(status: json['status'], errorMessage: json['message']);
  }
}

class ServerFailure implements Exception {
  final FailureModel failure;

  ServerFailure({required this.failure});
}

ServerFailure handleDioException(DioException dioException) {
  switch (dioException.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      throw ServerFailure(
        failure: FailureModel(
          status: "error",
          errorMessage: "Connection timed out. Please try again.",
        ),
      );

    case DioExceptionType.badResponse:
      if (dioException.response?.data != null) {
        return throw ServerFailure(
          failure: FailureModel.fromJson(dioException.response!.data),
        );
      } else {
        throw ServerFailure(
          failure: FailureModel(
            status: "error",
            errorMessage: "Bad response from server.",
          ),
        );
      }

    case DioExceptionType.cancel:
      throw ServerFailure(
        failure: FailureModel(
          status: "error",
          errorMessage: "Request was cancelled.",
        ),
      );

    case DioExceptionType.connectionError:
      throw ServerFailure(
        failure: FailureModel(
          status: "error",
          errorMessage: "No internet connection.",
        ),
      );

    case DioExceptionType.unknown:
      throw ServerFailure(
        failure: FailureModel(
          status: "error",
          errorMessage: dioException.message ?? "Unknown error occurred.",
        ),
      );

    case DioExceptionType.badCertificate:
      throw ServerFailure(
        failure: FailureModel(
          status: "error",
          errorMessage: "Bad certificate. Please check SSL configuration.",
        ),
      );

    // ignore: unreachable_switch_default
    default:
      throw ServerFailure(
        failure: FailureModel(
          status: "error",
          errorMessage: "Unexpected error occurred.",
        ),
      );
  }
}
