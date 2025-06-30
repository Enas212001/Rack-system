import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/api_key.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/features/home/Hotels/models/hotel_model.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotelItem extends StatelessWidget {
  const HotelItem({super.key, required this.hotel});
  final HotelModel hotel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r),
                bottomLeft: Radius.circular(8.r),
              ),
            ),
            width: 8.w,
            height: 72.h,
          ),
          Expanded(
            child: ListTile(
              tileColor: AppColors.backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8.r),
                  bottomRight: Radius.circular(8.r),
                ),
              ),
              contentPadding: EdgeInsets.all(5.r),
              title: Text(
                hotel.name![0].toUpperCase() +
                    hotel.name!.substring(1).toLowerCase(),
                style: CustomTextStyles.text12RegularGrey.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              subtitle: Text(
                hotel.buildingId!,
                style: CustomTextStyles.text11RegularGrey,
              ),
              leading: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(8.r),
                child: Image.network(
                  '${Endpoints.baseUrlImage}/${hotel.logo?.trim()}',
                  errorBuilder: (context, error, stackTrace) {
                    log('Image error: $error'); // Log the exact issue
                    return const Icon(Icons.error);
                  },
                  width: 50.w,
                  height: 50.h,
                  fit: BoxFit.cover,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.greyColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
