import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/widget/item_detail.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BuildingGuestItem extends StatelessWidget {
  const BuildingGuestItem({super.key});

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
                  SizedBox(
                    height: 20.h,
                    child: Image.asset(Assets.imagesBuildingGuest),
                  ),
                  Text(
                    'Building Name',
                    style: CustomTextStyles.text16MeduimText.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              ItemDetail(label: 'Hotel Id :', value: '100'),
              ItemDetail(label: 'Rack Id :', value: '100'),
              ItemDetail(label: 'Building Rack Id :', value: '100'),
            ],
          ),
        ),
        Positioned(
          right: 18.w,
          top: 18.h,
          child: SvgPicture.asset(Assets.imagesGuestShape),
        ),
      ],
    );
  }
}
