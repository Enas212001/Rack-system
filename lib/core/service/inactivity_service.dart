import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/cache/cache_helper.dart';
import 'package:flutter_application_1/core/utils/api_key.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/core/utils/service_locator.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:go_router/go_router.dart'; // Or Navigator

class InactivityService with WidgetsBindingObserver {
  static final InactivityService _instance = InactivityService._internal();
  factory InactivityService() => _instance;
  InactivityService._internal();

  Timer? _timer;
  final Duration timeout = const Duration(minutes: 10);

  void initialize(BuildContext context) {
    WidgetsBinding.instance.addObserver(this);
    _resetTimer(context);
  }

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _timer?.cancel();
  }

  void _resetTimer(BuildContext context) {
    _timer?.cancel();
    _timer = Timer(timeout, () {
      _logoutUser(context);
    });
  }

  void _logoutUser(BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Session timed out. Please log in again.',
          style: CustomTextStyles.text14Regular,
        ),
        backgroundColor: AppColors.primaryColor,
        duration: const Duration(seconds: 2),
      ),
    );
    final cache = getIt.get<CacheHelper>();
    await cache.removeData(key: 'isLogin');
    await cache.removeData(key: ApiKey.loginName);
    await cache.removeData(key: ApiKey.roleId);
    Future.delayed(const Duration(seconds: 2), () {
      AppRoutes.navigatorKey.currentContext?.go(AppRoutes.login);
    });
  }

  void handleUserInteraction(BuildContext context) {
    _resetTimer(context);
  }
}

class TouchInterceptor extends StatelessWidget {
  final Widget child;
  const TouchInterceptor({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => InactivityService().handleUserInteraction(context),
      onPanDown: (_) => InactivityService().handleUserInteraction(context),
      child: child,
    );
  }
}
