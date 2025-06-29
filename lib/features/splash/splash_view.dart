// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/cache/cache_helper.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/core/utils/service_locator.dart';
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
      Future.delayed(const Duration(seconds: 1), () {
        GoRouter.of(context).pushReplacement(AppRoutes.dashboard);
      });
    } else {
      Future.delayed(const Duration(seconds: 1), () {
        GoRouter.of(context).pushReplacement(AppRoutes.login);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset(Assets.imagesLogoblack, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
