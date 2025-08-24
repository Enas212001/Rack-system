import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/error/server_failure.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/rack_model/rack_item.dart';

abstract class RackRepo {
  Future<Either<ServerFailure, List<RackItem>>> getRacksInfo({
    required String buildingId,
  });
  Future<Either<ServerFailure, RackItem>> addRack({
    required String buildingId,
    required String buildingRId,
    required String rackName,
    required String rackSize,
    required String switchIds,
    required String siteName,
    required String rackModel,
  });
  Future<Either<ServerFailure, RackItem>> editRack({
    required String rackId,
    required String buildingRId,
    required String rackName,
    required String rackSize,
    required String switchIds,
    required String siteName,
    required String rackModel,
  });
  Future<Either<ServerFailure, RackItem>> deleteRack({required String rackId});
}
