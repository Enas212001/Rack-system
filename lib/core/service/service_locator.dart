import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/api/dio_consumer.dart';
import 'package:flutter_application_1/core/cache/cache_helper.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<DioConsumer>(DioConsumer(dio: Dio()));
  getIt.registerSingleton<CacheHelper>(CacheHelper());
}
