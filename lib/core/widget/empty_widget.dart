import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(Assets.imagesEmpty),
            SizedBox(height: 18.h),
            Text(
              'Don\'t have $text yet !',
              style: CustomTextStyles.text14W500Primary,
            ),
            SizedBox(height: 16.h),
            Text(
              'You can add $text by clicking the button on top',
              style: CustomTextStyles.text12RegularText,
            ),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }
}
