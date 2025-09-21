import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widget/tab_bar_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GuestRackTapBar extends StatelessWidget {
  const GuestRackTapBar({
    super.key,
    required this.selectedIndex,
    required this.onIndexChanged,
  });
  final int selectedIndex;
  final ValueChanged<int> onIndexChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 16.r) + EdgeInsets.only(top: 16.h),
      child: Row(
        children: [
          TapBarItem(
            index: 0,
            title: "Racks",
            selected: selectedIndex == 0,
            onIndexChanged: onIndexChanged,
          ),
          SizedBox(width: 24.w),
          TapBarItem(
            index: 1,
            title: "Switches",
            selected: selectedIndex == 1,
            onIndexChanged: onIndexChanged,
          ),
        ],
      ),
    );
  }
}
