import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/theme.dart';
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
      child: Text(
        text,
        style: CustomTextStyles.text12RegularGrey,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class TableHeadItem extends StatelessWidget {
  const TableHeadItem({super.key, required this.text, this.height, this.width});

  final String text;
  final double? height, width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 40.h,
      width: width,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        text,
        style: CustomTextStyles.text12MeduimText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
