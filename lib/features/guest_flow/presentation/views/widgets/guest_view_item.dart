import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class GuestViewItem extends StatelessWidget {
  const GuestViewItem({
    super.key,
    required this.image,
    required this.title,
    required this.widget,
  });
  final String image, title;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: EdgeInsets.all(16.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: AppColors.borderColor, width: 1.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 15,
                offset: const Offset(1, 1),
              ),
            ],
            color: AppColors.scaffoldBackgroundColor,
          ),
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(height: 20.h, child: Image.asset(image)),
                  Text(
                    title,
                    style: CustomTextStyles.text16MeduimText.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              widget,
            ],
          ),
        ),
        Positioned(
          right: 18.w,
          top: 16.h,
          child: SvgPicture.asset(Assets.imagesGuestShape),
        ),
      ],
    );
  }
}
