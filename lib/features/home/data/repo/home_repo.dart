import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/error/server_failure.dart';
import 'package:flutter_application_1/features/home/Buildings/models/building_model.dart';
import 'package:flutter_application_1/features/home/Hotels/models/hotel_model.dart';
import 'package:flutter_application_1/features/home/Racks/models/rack_info_model.dart';

abstract class HomeRepo {
  Future<Either<ServerFailure, List<HotelModel>>> getHotels();
  Future<Either<ServerFailure, List<BuildingModel>>> getBuildings({
    required String hotelId,
  });
  Future<Either<ServerFailure, List<RackInfoModel>>> getRacksInfo({
    required String buildingRId,
  });
  Future<Either<ServerFailure, HotelModel>> addHotel({
    required String hotelName,
    required String buildingNumber,
    required dynamic image,
  });
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
