import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
  });

  final String title, subTitle, image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 16.w) + EdgeInsets.only(top: 16.h),
      child: ListTile(
        leading: SvgPicture.asset(image),
        title: Text(
          title,
          style: CustomTextStyles.text12RegularGrey.copyWith(
            color: AppColors.textColor,
          ),
        ),
        subtitle: Text(subTitle, style: CustomTextStyles.text11RegularGrey),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
          side: const BorderSide(color: AppColors.borderColor),
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: AppColors.greyColor),
      ),
    );
  }
}
