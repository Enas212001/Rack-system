import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'add_client_widget.dart';
import 'common_widget.dart';
import 'images_grid_view.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonWidget(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 12.h),
          child: Column(
            children: [
              SizedBox(height: 15.h),
              AddClientWidget(),
              SizedBox(height: 20.h),
            ],
          ),
        ),
        Expanded(child: SingleChildScrollView(child: ImageGridView())),
      ],
    );
  }
}
