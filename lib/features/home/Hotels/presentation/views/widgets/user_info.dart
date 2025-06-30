import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/cache/cache_helper.dart';
import 'package:flutter_application_1/core/utils/api_key.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/service_locator.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(Assets.imagesProfileImage),
        SizedBox(width: 12.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back !',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
              getIt.get<CacheHelper>().getData(key: ApiKey.roleId),
              style: CustomTextStyles.text13Regular.copyWith(
                color: AppColors.greyColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
