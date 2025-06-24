import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'page_button.dart';

class BackAndNextButton extends StatelessWidget {
  const BackAndNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            PageButton(text: 'Previous'),
            Container(
              color: AppColors.primaryColor,
              padding: EdgeInsets.all(4),
              child: Text(
                '1',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(color: AppColors.whiteColor),
              ),
            ),
            PageButton(text: 'Next'),
          ],
        ),
      ),
    );
  }
}
