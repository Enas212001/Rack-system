import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key, this.height = 200});
  final double height;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Padding(
          padding: EdgeInsets.all(18.r),
          child: Shimmer(
            duration: const Duration(seconds: 3),
            interval: const Duration(seconds: 5),
            color: Colors.white,
            colorOpacity: 0.3,
            enabled: true,
            direction: const ShimmerDirection.fromLTRB(),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.borderColor,
              ),
              height: height.h,
            ),
          ),
        );
      }, childCount: 5),
    );
  }
}
