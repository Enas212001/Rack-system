import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/cache/cache_helper.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/core/utils/service_locator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController rotateController;
  late Animation<double> rotation;

  late AnimationController revealController;
  late Animation<double> widthFactor;

  bool showIcon = true;

  @override
  void initState() {
    super.initState();

    // Rotate icon 0° -> 45° -> 0°
    rotateController = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );
    rotation =
        TweenSequence([
          TweenSequenceItem(tween: Tween(begin: 0.0, end: pi / 4), weight: 50),
          TweenSequenceItem(tween: Tween(begin: pi / 4, end: 0.0), weight: 50),
        ]).animate(
          CurvedAnimation(parent: rotateController, curve: Curves.easeInOut),
        );

    // Reveal full logo animation
    revealController = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );
    widthFactor = Tween<double>(begin: 0.25, end: 1.0).animate(
      CurvedAnimation(parent: revealController, curve: Curves.easeInOut),
    );

    _startAnimation();
  }

  Future<void> _startAnimation() async {
    await rotateController.forward();
    setState(() => showIcon = false); // hide icon after rotate
    await Future.delayed(const Duration(milliseconds: 100));
    await revealController.forward(); // reveal full image
    Timer(const Duration(seconds: 5), () {
      final bool isLogin =
          getIt<CacheHelper>().getData(key: 'isLogin') ?? false;
      GoRouter.of(
        context,
      ).pushReplacement(isLogin ? AppRoutes.hotels : AppRoutes.login);
    });
  }

  @override
  void dispose() {
    rotateController.dispose();
    revealController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: showIcon
            ? AnimatedBuilder(
                animation: rotation,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: rotation.value,
                    child: Image.asset(
                      Assets.imagesLogoblackIcon,
                      width: 200.w,
                    ),
                  );
                },
              )
            : AnimatedBuilder(
                animation: widthFactor,
                builder: (context, child) {
                  return ClipRect(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      widthFactor: widthFactor.value,
                      child: Image.asset(Assets.imagesLogoblack, width: 240.w),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
