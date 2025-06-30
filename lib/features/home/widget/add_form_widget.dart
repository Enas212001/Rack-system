import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'top_add_widget.dart';

class AddFormWidget extends StatelessWidget {
  const AddFormWidget({super.key, this.childWidget, this.title});
  final Widget? childWidget;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TopAddWidget(title: title),
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 90.h),
              Center(
                child: Card(
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
      ],
    );
  }
}
