import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          DrawerItem(image: Assets.imagesHome, title: 'Home', onTap: () {}),
          DrawerItem(
            image: Assets.imagesAddHotel,
            title: 'Add Hotel',
            onTap: () {},
          ),
          DrawerItem(image: Assets.imagesUsers, title: 'Users', onTap: () {}),
          DrawerItem(
            image: Assets.imagesAddUser,
            title: 'Add User',
            onTap: () {},
          ),
          DrawerItem(image: Assets.imagesLogOut, title: 'Logout', onTap: () {}),
        ],
      ),
    );
  }
}
