import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconWithTitle extends StatelessWidget {
  const IconWithTitle({
    super.key,
    required this.title,
    required this.image,
    this.color = AppColors.primaryColor,
  });
  final String title, image;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Image.asset(image, width: 32.w, height: 38.h),
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.displaySmall!.copyWith(color: color),
          ),
          SizedBox(width: 5.w),
        ],
      ),
    );
  }
}
