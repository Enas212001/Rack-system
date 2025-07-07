import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/api/api_consumer.dart';
import 'package:flutter_application_1/core/error/server_failure.dart';
import 'package:flutter_application_1/core/utils/api_key.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/rack_info_model.dart';

import 'rack_repo.dart';

class RackRepoImpl implements RackRepo{
  final ApiConsumer api;

  RackRepoImpl({required this.api});
    @override
  Future<Either<ServerFailure, List<RackInfoModel>>> getRacksInfo({
    required String buildingRId,
  }) async {
    try {
      final response = await api.get(Endpoints.getRacksInfo(buildingRId));
      if (response is Map<String, dynamic>) {
        if (response['status'] == 'error') {
          throw ServerFailure(failure: FailureModel.fromJson(response));
        }
        final data = response['data'] as List<dynamic>;
        final racks = data
            .map((item) => RackInfoModel.fromJson(item as Map<String, dynamic>))
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
  Future<Either<ServerFailure, RackInfoModel>> addRack({
    required String buildingRId,
    required String switchId,
    required String productPanel,
    required String productSerial,
    required String productMac,
    required String productModel,
    required String productPort,
    required String deviceName,
    required String siteName,
  }) async {
    try {
      final response = await api.post(
        Endpoints.addRack,
        data: {
          ApiKey.buildingRackId: buildingRId,
          ApiKey.switchId: switchId,
          ApiKey.productPanel: productPanel,
          ApiKey.productSerial: productSerial,
          ApiKey.productMac: productMac,
          ApiKey.productModel: productModel,
          ApiKey.productPort: productPort,
          ApiKey.deviceName: deviceName,
          ApiKey.siteName: siteName,
        },
      );
      final rack = RackInfoModel.fromJson(response);
      return right(rack);
    } on ServerFailure catch (e) {
      log('Error parsing buildings: $e');
      return left(e);
    }
  }

}