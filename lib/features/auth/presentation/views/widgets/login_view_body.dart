import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'login_form.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 33.w, vertical: 8.h),
        color: Colors.white,
        width: 347.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(Assets.imagesPowerSMTPLogo, width: 74.w, height: 74.h),
            SizedBox(height: 16.h),
            Image.asset(Assets.imagesLogoblack, width: 114.w, height: 45.h),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
