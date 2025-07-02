import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/cache/cache_helper.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/core/utils/service_locator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  bool startSlide = false;

  @override
  void initState() {
    super.initState();

    rotateController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    rotation =
        TweenSequence([
          TweenSequenceItem(tween: Tween(begin: 0.0, end: pi / 2), weight: 50),
          TweenSequenceItem(tween: Tween(begin: pi / 2, end: 0.0), weight: 50),
        ]).animate(
          CurvedAnimation(parent: rotateController, curve: Curves.easeInOut),
        );

    revealController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    widthFactor = Tween<double>(begin: 0.22, end: 1.0).animate(
      CurvedAnimation(parent: revealController, curve: Curves.easeInOut),
    );

    _startAnimation();
  }

  Future<void> _startAnimation() async {
    await rotateController.forward();
    await revealController.forward();

    /// Trigger upward slide AFTER both animations
    setState(() {
      startSlide = true;
    });

    /// Wait for slide animation (in build) to complete before navigating
    await Future.delayed(const Duration(milliseconds: 1000));

    final bool isLogin = getIt<CacheHelper>().getData(key: 'isLogin') ?? false;
    GoRouter.of(
      // ignore: use_build_context_synchronously
      context,
    ).pushReplacement(isLogin ? AppRoutes.hotels : AppRoutes.login);
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
      body: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeInOut,
            top: startSlide
                ? MediaQuery.of(context).size.height * 0.092.h
                : MediaQuery.of(context).size.height * 0.5.h - 45.h,
            child: AnimatedBuilder(
              animation: Listenable.merge([rotation, widthFactor]),
              builder: (context, child) {
                return Transform.rotate(
                  angle: widthFactor.value > 0.23 ? 0 : rotation.value,
                  child: ClipRect(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      widthFactor: widthFactor.value,
                      child: Hero(
                        tag: 'logo',
                        child: Image.asset(Assets.imagesAppLogo),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
