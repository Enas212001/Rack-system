import 'package:flutter_application_1/features/home/data/models/hotel_model/hotel_model.dart';

abstract class HomeRepo {
  Future<List<HotelModel>> getBuildings();
}