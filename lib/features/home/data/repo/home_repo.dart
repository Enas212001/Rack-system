import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/error/server_failure.dart';
import 'package:flutter_application_1/features/home/data/models/building_model/building_model.dart';
import 'package:flutter_application_1/features/home/data/models/hotel_model/hotel_model.dart';
import 'package:flutter_application_1/features/home/data/models/rack_info_model/rack_info_model.dart';

abstract class HomeRepo {
  Future<Either<ServerFailure, List<HotelModel>>> getHotels();
  Future<Either<ServerFailure, List<BuildingModel>>> getBuildings();
  Future<Either<ServerFailure, List<RackInfoModel>>> getRacksInfo();
}
