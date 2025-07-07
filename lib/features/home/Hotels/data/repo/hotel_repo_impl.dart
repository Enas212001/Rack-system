import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/api/api_consumer.dart';
import 'package:flutter_application_1/core/error/server_failure.dart';
import 'package:flutter_application_1/core/utils/api_key.dart';
import 'package:flutter_application_1/features/home/Hotels/data/models/hotel_model.dart';

import 'hotel_repo.dart';

class HotelRepoImpl implements HotelRepo {
  final ApiConsumer api;

  HotelRepoImpl({required this.api});

  @override
  Future<Either<ServerFailure, HotelModel>> addHotel({
    required String hotelName,
    required String buildingNumber,
    required image,
  }) async {
    try {
      final response = await api.post(
        Endpoints.addHotel,
        isFormData: true,
        data: {
          ApiKey.hotelName: hotelName,
          ApiKey.buildingNumber: buildingNumber,
          ApiKey.image: image,
        },
      );
      final hotel = HotelModel.fromJson(response);
      return right(hotel);
    } on ServerFailure catch (e) {
      log('Error parsing Hotels: $e');
      return left(e);
    }
  }

  @override
  Future<Either<ServerFailure, List<HotelModel>>> getHotels() async {
    final response = await api.get(Endpoints.getHotels);
    try {
      final hotels = (response as List)
          .map((item) => HotelModel.fromJson(item))
          .toList();

      log('HOTELS COUNT: ${hotels.length}');
      return right(hotels);
    } on ServerFailure catch (e) {
      log('Error parsing hotels: $e');
      return left(e);
    }
  }
}
