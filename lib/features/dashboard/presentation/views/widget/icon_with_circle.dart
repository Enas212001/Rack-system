import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconWithCircle extends StatelessWidget {
  const IconWithCircle({super.key, required this.icon});
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5.w),
      child: Container(
        width: 36.r,
        height: 36.r,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey, // customize color
            width: 1.w, // customize thickness
          ),
        ),
        child: Icon(icon),
      ),
    );
  }
}
