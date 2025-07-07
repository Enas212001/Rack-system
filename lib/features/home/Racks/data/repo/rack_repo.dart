import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/error/server_failure.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/rack_info_model.dart';

abstract class RackRepo {
  Future<Either<ServerFailure, List<RackInfoModel>>> getRacksInfo({
    required String buildingRId,
  });
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
  });
}