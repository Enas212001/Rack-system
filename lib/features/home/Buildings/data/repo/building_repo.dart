import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/error/server_failure.dart';
import 'package:flutter_application_1/features/home/Buildings/data/models/building_model.dart';

abstract class BuildingRepo {
  Future<Either<ServerFailure, List<BuildingModel>>> getBuildings({
    required String hotelId,
  });

  Future<Either<ServerFailure, BuildingModel>> addBuilding({
    required String buildingName,
    required String rackId,
    required String buildingRackId,
    required String hotelId,
  });

  Future<Either<ServerFailure, BuildingModel>> editBuilding({
    required String buildingId,
    required String buildingName,
    required String rackId,
    required String buildingRackId,
  });
  Future<Either<ServerFailure, BuildingModel>> deleteBuilding({
    required String buildingId,
  });
}
