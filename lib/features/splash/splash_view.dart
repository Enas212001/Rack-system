import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late AnimationController _transitionController;
  bool _showFullLogo = false;
  bool _moveLogo = false;

  @override
  void initState() {
    super.initState();

    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _transitionController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _rotationController.forward().whenComplete(() {
      setState(() => _showFullLogo = true);
      _transitionController.forward();
      setState(() => _moveLogo = true);

      Timer(const Duration(milliseconds: 900), () {
        bool isLogin =
            getIt.get<CacheHelper>().getData(key: 'isLogin') ?? false;
        GoRouter.of(
          context,
        ).pushReplacement(isLogin ? AppRoutes.dashboard : AppRoutes.login);
      });
    });
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _transitionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background
          Positioned.fill(child: Container(color: AppColors.whiteColor)),

          // Rotating icon part (hide when full logo is shown)
          if (!_showFullLogo)
            Center(
              child: RotationTransition(
                turns: Tween<double>(
                  begin: 0,
                  end: 1,
                ).animate(_rotationController),
                child: Image.asset(Assets.imagesLogoblackIcon, height: 120.h),
              ),
            ),

          // Full logo appearing and moving to top
          AnimatedPositioned(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeOut,
            top: _moveLogo ? screenHeight * 0.046 : screenHeight * 0.5,
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 800),
              opacity: _showFullLogo ? 1.0 : 0.0,
              child: Center(
                child: Image.asset(Assets.imagesLogoblack, height: 140.h),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
