import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/api/api_consumer.dart';

import 'package:flutter_application_1/core/error/server_failure.dart';
import 'package:flutter_application_1/core/utils/api_key.dart';

import 'package:flutter_application_1/features/home/Buildings/data/models/building_model.dart';

import 'building_repo.dart';

class BuildingRepoImpl implements BuildingRepo {
  final ApiConsumer api;

  BuildingRepoImpl({required this.api});
  @override
  Future<Either<ServerFailure, BuildingModel>> addBuilding({
    required String buildingName,
    required String hotelId,
  }) async {
    try {
      final response = await api.post(
        Endpoints.addBuilding(hotelId),
        data: {
          ApiKey.buildingName: buildingName,
        },
      );
      final building = BuildingModel.fromJson(response);
      return right(building);
    } on ServerFailure catch (e) {
      log('Error parsing buildings: $e');
      return left(e);
    }
  }

  @override
  Future<Either<ServerFailure, List<BuildingModel>>> getBuildings({
    required String hotelId,
  }) async {
    final response = await api.get(Endpoints.getBuildings(hotelId));
    try {
      final buildings = (response as List)
          .map((item) => BuildingModel.fromJson(item))
          .toList();
      log('BUILDINGS COUNT: ${buildings.length}');
      return right(buildings);
    } on ServerFailure catch (e) {
      log('Error parsing buildings: $e');
      return left(e);
    }
  }

  @override
  Future<Either<ServerFailure, BuildingModel>> deleteBuilding({
    required String buildingId,
  }) async {
    try {
      final response = await api.delete(Endpoints.deleteBuilding(buildingId));
      final building = BuildingModel.fromJson(response);
      return right(building);
    } on ServerFailure catch (e) {
      log('Error parsing buildings: $e');
      return left(e);
    }
  }

  @override
  Future<Either<ServerFailure, BuildingModel>> editBuilding({
    required String buildingId,
    required String buildingName,
  }) async {
    try {
      final response = await api.put(
        Endpoints.editBuilding(buildingId),
        data: {
          ApiKey.buildingName: buildingName,
        },
      );
      final building = BuildingModel.fromJson(response);
      return right(building);
    } on ServerFailure catch (e) {
      log('Error parsing buildings: $e');
      return left(e);
    }
  }
}
