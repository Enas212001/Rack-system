import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'icon_with_text_bg.dart';

class BuildingInfo extends StatelessWidget {
  const BuildingInfo({super.key, required this.hotelName});
final String hotelName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: 12.h) + EdgeInsets.only(left: 28.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconTextWithBG(icon: Icons.calendar_month_outlined, text: 'Date'),
              SizedBox(width: 8.w),
              IconTextWithBG(text: 'Export', icon: Icons.open_in_new),
              SizedBox(width: 8.w),
              Image.asset(Assets.imagesAddIcon),
            ],
          ),
          Row(
            children: [
              Text.rich(
                TextSpan(
                  text: hotelName,
                  style: Theme.of(context).textTheme.titleSmall,
                  children: [
                    TextSpan(
                      text: '/Buildings',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
