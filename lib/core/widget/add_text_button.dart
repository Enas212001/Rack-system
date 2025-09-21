import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddTextButton extends StatelessWidget {
  const AddTextButton({
    super.key,
    required this.title,
    this.onTap,
    this.isRack = false,
  });
  final String title;
  final Function()? onTap;
  final bool isRack;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: isRack ? 6.w : 12.w),
        child: Text(
          title,
          style: isRack
              ? CustomTextStyles.text14W500Primary
              : CustomTextStyles.text16MeduimText.copyWith(
                  color: AppColors.primaryColor,
                ),
        ),
      ),
    );
  }
}
