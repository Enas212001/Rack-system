import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageButton extends StatelessWidget {
  const PageButton({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsGeometry.all(8.w),
      child: Text(text, style: Theme.of(context).textTheme.titleLarge),
    );
  }
}
