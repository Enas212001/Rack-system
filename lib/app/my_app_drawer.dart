import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'drawer_item.dart';

class MyAppDrawer extends StatelessWidget {
  const MyAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 230.w,
      backgroundColor: AppColors.scaffoldBackgroundColor,
      child: ListView(
        children: [
          SizedBox(height: 36.h),
          Image.asset(Assets.imagesAppLogo, height: 50.h),
          SizedBox(height: 36.h),
          DrawerItem(
            image: Assets.imagesHome,
            title: 'Home',
            onTap: () {
              context.pushReplacement(AppRoutes.hotels);
            },
          ),
          DrawerItem(
            image: Assets.imagesUsers,
            title: 'Users',
            onTap: () {
              context.push(AppRoutes.users);
            },
          ),
          DrawerItem(
            image: Assets.imagesAddUser,
            title: 'Add User',
            onTap: () {
              context.push(AppRoutes.addUser);
            },
          ),
          DrawerItem(image: Assets.imagesLogOut, title: 'Logout', onTap: () {}),
        ],
      ),
    );
  }
}
