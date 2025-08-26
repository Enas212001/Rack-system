import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/api/api_consumer.dart';
import 'package:flutter_application_1/core/error/server_failure.dart';
import 'package:flutter_application_1/core/utils/api_key.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/summary_model/summary_item.dart';

abstract class SummaryRepo {
  Future<Either<ServerFailure, List<SummaryItem>>> getSummary({
    required String switchId,
  });
}

class SummaryRepoImpl implements SummaryRepo {
  final ApiConsumer apiConsumer;
  SummaryRepoImpl({required this.apiConsumer});
  @override
  Future<Either<ServerFailure, List<SummaryItem>>> getSummary({
    required String switchId,
  }) async {
    try {
      final response = await apiConsumer.get(Endpoints.getSummary(switchId));
      if (response['status'] == 'success') {
        final data = response['data'];
        if (data is List) {
          final summaries = data
              .map((e) => SummaryItem.fromJson(e as Map<String, dynamic>))
              .toList();
          return Right(summaries);
        } else {
          return Left(
            ServerFailure(
              failure: FailureModel(
                status: 'false',
                errorMessage: 'Invalid data format from API',
              ),
            ),
          );
        }
      } else {
        return Left(
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
}
