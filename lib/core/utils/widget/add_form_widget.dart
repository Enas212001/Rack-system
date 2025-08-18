import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'top_add_widget.dart';

class AddFormWidget extends StatelessWidget {
  const AddFormWidget({
    super.key,
    this.childWidget,
    this.title,
    this.isEdit = false,
  });
  final Widget? childWidget;
  final String? title;
  final bool isEdit;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: TopAddWidget(title: title, isEdit: isEdit),
        ),
        Padding(
          padding: EdgeInsets.only(top: 90.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Card(
                    color: AppColors.whiteColor,
                    margin: EdgeInsets.all(16.r),
                    elevation: 6.r,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 11.r) +
                          EdgeInsets.only(top: 16.h),
                      child: childWidget,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
