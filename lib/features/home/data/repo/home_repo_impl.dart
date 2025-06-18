import 'dart:developer';

import 'package:flutter_application_1/core/api/api_consumer.dart';
import 'package:flutter_application_1/features/home/data/models/hotel_model/hotel_model.dart';
import 'package:flutter_application_1/features/home/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiConsumer api;

  HomeRepoImpl({required this.api});

  @override
  Future<List<HotelModel>> getBuildings() async {
    final response = await api.get('http://10.0.2.2/racksys/get_hotels.php');

    log('RESPONSE DATA TYPE: ${response.runtimeType}');
    log('RESPONSE RAW: $response');

    // response is already a List<dynamic>, so no need to access .data or .statusCode
    final hotels = (response as List)
        .map((item) => HotelModel.fromJson(item))
        .toList();

    log('HOTELS COUNT: ${hotels.length}');
    return hotels;
  }
}
