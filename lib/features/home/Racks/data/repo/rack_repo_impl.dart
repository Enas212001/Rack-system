import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/api/api_consumer.dart';
import 'package:flutter_application_1/core/error/server_failure.dart';
import 'package:flutter_application_1/core/utils/api_key.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/rack_model/rack_item.dart';

import 'rack_repo.dart';

class RackRepoImpl implements RackRepo {
  final ApiConsumer api;

  RackRepoImpl({required this.api});
  @override
  Future<Either<ServerFailure, List<RackItem>>> getRacksInfo({
    required String buildingId,
  }) async {
    try {
      final response = await api.get(Endpoints.getRacksInfo(buildingId));
      if (response is Map<String, dynamic>) {
        if (response['status'] == 'error') {
          throw ServerFailure(failure: FailureModel.fromJson(response));
        }
        final data = response['data'] as List<dynamic>;
        final racks = data
            .map((item) => RackItem.fromJson(item as Map<String, dynamic>))
            .toList();
        return right(racks);
      }
      throw ServerFailure(
        failure: FailureModel(
          status: 'error',
          errorMessage: 'Unexpected response format.',
        ),
      );
    } on ServerFailure catch (e) {
      log('Error parsing racks: $e');
      return left(e);
    } catch (e) {
      log('Unexpected error: $e');
      return left(
        ServerFailure(
          failure: FailureModel(status: 'error', errorMessage: e.toString()),
        ),
      );
    }
  }

  @override
  Future<Either<ServerFailure, RackItem>> addRack({
    required String buildingId,
    required String buildingRId,
    required String rackName,
    required String rackSize,
    required String switchIds,
    required String siteName,
    required String rackModel,
  }) async {
    try {
      final response = await api.post(
        Endpoints.addRack(buildingId),
        data: {
          ApiKey.buildingRackId: buildingRId,
          ApiKey.switchIds: switchIds,
          ApiKey.rackName: rackName,
          ApiKey.rackSize: rackSize,
          ApiKey.siteName: siteName,
          ApiKey.rackModel: rackModel,
        },
      );
      final rack = RackItem.fromJson(response['data']);
      return right(rack);
    } on ServerFailure catch (e) {
      log('Error parsing buildings: $e');
      return left(e);
    }
  }

  @override
  Future<Either<ServerFailure, RackItem>> deleteRack({
    required String rackId,
  }) async {
    try {
      final response = await api.delete(Endpoints.deleteRack(rackId));
      final rack = RackItem.fromJson(response['data']);
      return right(rack);
    } on ServerFailure catch (e) {
      log('Error parsing buildings: $e');
      return left(e);
    }
  }

  @override
  Future<Either<ServerFailure, RackItem>> editRack({
    required String rackId,
    required String buildingRId,
    required String rackName,
    required String rackSize,
    required String switchIds,
    required String siteName,
    required String rackModel,
  }) async {
    try {
      final response = await api.put(
        Endpoints.editRack(rackId),
        data: {
          ApiKey.buildingRackId: buildingRId,
          ApiKey.switchIds: switchIds,
          ApiKey.rackName: rackName,
          ApiKey.rackSize: rackSize,
          ApiKey.siteName: siteName,
          ApiKey.rackModel: rackModel,
        },
      );
      final rack = RackItem.fromJson(response['data']);
      return right(rack);
    } on ServerFailure catch (e) {
      log('Error parsing buildings: $e');
      return left(e);
    }
  }
}
