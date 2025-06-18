import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/cache/cache_helper.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/core/utils/service_locator.dart';
import 'package:flutter_application_1/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    bool isLogin = getIt.get<CacheHelper>().getData(key: 'isLogin') ?? false;
    if (isLogin) {
      Future.delayed(const Duration(microseconds: 2), () {
        BlocProvider.of<HomeCubit>(context).getBuildings();
        GoRouter.of(context).pushReplacement(AppRoutes.dashboard);
      });
    } else {
      Future.delayed(const Duration(microseconds: 2), () {
        GoRouter.of(context).pushReplacement(AppRoutes.login);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
