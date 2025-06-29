import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'login_form.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.03.h),
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              Assets.imagesLogoblack,
              width: 114.w,
              height: 45.h,
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.06.h),
          Text(
            'Log In to your Account',
            style: Theme.of(
              context,
            ).textTheme.titleSmall!.copyWith(color: AppColors.primaryColor),
          ),
          LoginForm(),
        ],
      ),
    );
  }
}
