import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/cache/cache_helper.dart';
import 'package:flutter_application_1/core/utils/api_key.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/service_locator.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_app_bar.dart';
import 'icon_with_circle.dart';

class CommonWidget extends StatelessWidget {
  const CommonWidget({super.key, this.popUp = false});
  final bool popUp;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 28.w) +
              EdgeInsets.only(top: 12.h),
          child: Row(
            children: [
              popUp
                  ? GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.primaryColor,
                      ),
                    )
                  : SizedBox.shrink(),
              Text(
                'Welcome Back ${getIt.get<CacheHelper>().getData(key: ApiKey.loginName)}',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const Spacer(),
              IconWithCircle(icon: Icons.person_2_outlined),
              SizedBox(width: 8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getIt.get<CacheHelper>().getData(key: ApiKey.loginName),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    getIt.get<CacheHelper>().getData(key: ApiKey.roleId),
                    style: CustomTextStyles.text14Regular,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
