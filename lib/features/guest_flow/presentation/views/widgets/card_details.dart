import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/func/container_decoration.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailCard extends StatefulWidget {
  const DetailCard({
    super.key,
    required this.topCard,
    required this.bottomCard,
  });
  final Widget topCard, bottomCard;

  @override
  State<DetailCard> createState() => _DetailCardState();
}

class _DetailCardState extends State<DetailCard> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      decoration: containerDecoration(),
      child: Column(
        children: [
          widget.topCard,
          Divider(color: AppColors.borderColor, height: 1),
          SizedBox(height: 12.h),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      isExpanded ? 'Hide Details' : 'View Details',
                      style: CustomTextStyles.text12RegularGrey.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_up_rounded
                          : Icons.keyboard_arrow_down_rounded,
                      size: 18.sp,
                      color: AppColors.primaryColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 6.h),
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            alignment: Alignment.centerLeft,
            child: isExpanded ? widget.bottomCard : SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
