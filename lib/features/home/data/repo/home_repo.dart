import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/error/server_failure.dart';
import 'package:flutter_application_1/features/home/data/models/building_model/building_model.dart';
import 'package:flutter_application_1/features/home/data/models/hotel_model/hotel_model.dart';
import 'package:flutter_application_1/features/home/data/models/rack_info_model/rack_info_model.dart';

abstract class HomeRepo {
  Future<Either<ServerFailure, List<HotelModel>>> getHotels();
  Future<Either<ServerFailure, List<BuildingModel>>> getBuildings({
    required String hotelId,
  });
  Future<Either<ServerFailure, List<RackInfoModel>>> getRacksInfo();
  Future<Either<ServerFailure, BuildingModel>> addBuilding({
    required String buildingName,
    required String rackId,
    required String buildingRackId,
    required String hotelId,
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
