import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconWithCircle extends StatelessWidget {
  const IconWithCircle({super.key, required this.icon, this.isBack});
  final IconData? icon;
  final bool? isBack;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5.w),
      child: Container(
        width: 36.w,
        height: 36.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey, width: 1.w),
          color: isBack == true ? Colors.grey.shade300 : Colors.transparent,
        ),
        child: Icon(icon),
      ),
    );
  }
}
