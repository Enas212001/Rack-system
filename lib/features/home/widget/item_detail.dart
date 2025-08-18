import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ItemDetail extends StatelessWidget {
  const ItemDetail({
    super.key,
    this.label,
    this.value,
    this.isAction = false,
    this.onEdit,
    this.onDelete,
  });
  final String? label, value;
  final bool isAction;
  final VoidCallback? onEdit, onDelete;
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
            child: isAction
                ? Row(
                    children: [
                      GestureDetector(
                        onTap: onEdit,
                        child: SvgPicture.asset(Assets.imagesEdit),
                      ),
                      GestureDetector(
                        onTap: onDelete,
                        child: SvgPicture.asset(Assets.imagesDelete),
                      ),
                    ],
                  )
                : Text(
                    value ?? 'N/A',
                    style: CustomTextStyles.text12RegularGrey,
                  ),
          ),
        ],
      ),
    );
  }
}
