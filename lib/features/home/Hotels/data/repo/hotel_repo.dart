import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/error/server_failure.dart';
import 'package:flutter_application_1/features/home/Hotels/data/models/hotel_model.dart';

abstract class HotelRepo {
    Future<Either<ServerFailure, List<HotelModel>>> getHotels();
  Future<Either<ServerFailure, HotelModel>> addHotel({
    required String hotelName,
    required String buildingNumber,
    required dynamic image,
  });

}