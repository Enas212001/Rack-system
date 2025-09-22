import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_strings.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessMessage extends StatelessWidget {
  const SuccessMessage({super.key, required this.messageName, this.isEdit});
  final String messageName;
  final bool? isEdit;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(35.r),
        child: Card(
          color: AppColors.scaffoldBackgroundColor,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 45.w, vertical: 20.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(Assets.imagesAdded, width: 50.w, height: 50.h),
                SizedBox(height: 12.h),
                Text(
                  isEdit == true
                      ? AppStrings.successMessageEdit(messageName)
                      : AppStrings.successMessage(messageName),
                  style: CustomTextStyles.text14W500Primary,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
