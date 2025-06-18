import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/api/dio_consumer.dart';
import 'package:flutter_application_1/core/cache/cache_helper.dart';
import 'package:flutter_application_1/features/home/data/repo/home_repo_impl.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<DioConsumer>(DioConsumer(dio: Dio()));
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerSingleton(HomeRepoImpl(api: getIt.get<DioConsumer>()));
}
