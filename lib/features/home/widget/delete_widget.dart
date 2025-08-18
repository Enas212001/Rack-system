import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_button.dart';

class DeleteWidget extends StatelessWidget {
  const DeleteWidget({super.key, required this.onDelete, required this.title});

  final VoidCallback onDelete;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 320.w,
          padding: EdgeInsets.all(24.r),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 16,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Delete Record',
                style: CustomTextStyles.text16MeduimText.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: 14.h),
              Text(
                'Are you sure you need to delete this $title ?',
                style: CustomTextStyles.text16MeduimText.copyWith(
                  color: AppColors.lightGreyColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: CustomButton(
                      text: 'Cancel',
                      isPrimary: false,
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: CustomButton(
                      text: 'Delete',
                      isPrimary: true,
                      onPressed: () {
                        onDelete();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
