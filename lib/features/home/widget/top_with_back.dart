import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/features/home/Hotels/presentation/views/widgets/top_widget.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopWithBack extends StatelessWidget {
  const TopWithBack({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return TopWidget(
      widget: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.whiteColor,
              size: 20.sp,
            ),
          ),
          Spacer(flex: 2),
          Text(
            text,
            style: CustomTextStyles.text14W500Primary.copyWith(
              color: AppColors.whiteColor,
            ),
          ),
          Spacer(flex: 3),
        ],
      ),
    );
  }
}
