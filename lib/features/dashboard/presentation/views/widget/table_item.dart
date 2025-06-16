import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TableItem extends StatelessWidget {
  const TableItem({
    super.key,
    required this.text,
    this.color,
    this.height,
    this.width,
    this.textColor,
  });
  final String text;
  final Color? color, textColor;
  final double? height, width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 40.h,
      width: width,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      color: color ?? AppColors.whiteColor,
      child: Text(
        text,
        style: Theme.of(
          context,
        ).textTheme.titleLarge!.copyWith(color: textColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}
