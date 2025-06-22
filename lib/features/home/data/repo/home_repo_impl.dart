import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/api/api_consumer.dart';
import 'package:flutter_application_1/core/error/server_failure.dart';
import 'package:flutter_application_1/core/utils/api_key.dart';
import 'package:flutter_application_1/features/home/data/models/building_model/building_model.dart';
import 'package:flutter_application_1/features/home/data/models/hotel_model/hotel_model.dart';
import 'package:flutter_application_1/features/home/data/models/rack_info_model/rack_info_model.dart';
import 'package:flutter_application_1/features/home/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiConsumer api;

  HomeRepoImpl({required this.api});

  @override
  Future<Either<ServerFailure, List<HotelModel>>> getHotels() async {
    final response = await api.get(Endpoints.getHotels);
    try {
      // response is already a List<dynamic>, so no need to access .data or .statusCode
      final hotels = (response as List)
          .map((item) => HotelModel.fromJson(item))
          .toList();

      log('HOTELS COUNT: ${hotels.length}');
      return right(hotels); // Return the list of hotels wrapped in Either
    } on ServerFailure catch (e) {
      log('Error parsing hotels: $e');
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
      return right(buildings); // Return the list of buildings wrapped in Either
    } on ServerFailure catch (e) {
      log('Error parsing buildings: $e');
      return left(e);
    }
  }

  @override
  Future<Either<ServerFailure, List<RackInfoModel>>> getRacksInfo() async {
    try {
      final response = await api.get(Endpoints.getRacksInfo);
      final racks = (response as List)
          .map((item) => RackInfoModel.fromJson(item))
          .toList();
      return right(racks);
    } on ServerFailure catch (e) {
      log('Error parsing buildings: $e');
      return left(e);
    }
  }

  @override
  Future<Either<ServerFailure, BuildingModel>> addBuilding({
    required String buildingName,
    required String rackId,
    required String buildingRackId,
    required String hotelId,
  }) async {
    try {
      final response = await api.post(
        Endpoints.addBuilding(hotelId),
        data: {
          ApiKey.buildingName: buildingName,
          ApiKey.rackId: int.parse(rackId),
          ApiKey.buildingRackId: buildingRackId,
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
