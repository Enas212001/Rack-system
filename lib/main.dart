import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/cache/cache_helper.dart';
import 'package:flutter_application_1/core/utils/service_locator.dart';
import 'package:flutter_application_1/simple_bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  Bloc.observer = SimpleBLocObserver();
  await getIt<CacheHelper>().init();

  runApp(MyApp());
}
