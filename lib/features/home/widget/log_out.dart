import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/cache/cache_helper.dart';
import 'package:flutter_application_1/core/utils/api_key.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/core/utils/service_locator.dart';
import 'package:go_router/go_router.dart';

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final cache = getIt.get<CacheHelper>();
        await cache.removeData(key: 'isLogin');
        await cache.removeData(key: ApiKey.loginName);
        await cache.removeData(key: ApiKey.roleId);
        // ignore: use_build_context_synchronously
        GoRouter.of(context).go(AppRoutes.login);
      },
      child: Icon(Icons.logout_outlined, color: AppColors.primaryColor),
    );
  }
}
