import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TableItem extends StatelessWidget {
  const TableItem({super.key, required this.text, this.color});
  final String text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h, // Adjust row height here
      alignment: Alignment.center, // Center vertically & horizontally
      padding: const EdgeInsets.symmetric(horizontal: 8),
      color: color ?? AppColors.whiteColor,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14, // Optional: adjust font size
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
