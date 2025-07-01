import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RackItemDetail extends StatelessWidget {
  const RackItemDetail({super.key, this.label, this.value});
  final String? label, value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110.w,
            child: Text(
              '$label:',
              style: CustomTextStyles.text12RegularGrey.copyWith(
                color: AppColors.textColor,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value ?? 'N/A',
              style: CustomTextStyles.text12RegularGrey,
            ),
          ),
        ],
      ),
    );
  }
}
