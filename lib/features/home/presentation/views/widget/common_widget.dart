import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_app_bar.dart';
import 'icon_with_circle.dart';
import 'notifications_number.dart';

class CommonWidget extends StatelessWidget {
  const CommonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 28.w) +
              EdgeInsets.only(top: 12.h),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Back Mohand',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(height: 8.h),
                  NotificationsNumberWidget(),
                ],
              ),
              const Spacer(),
              IconWithCircle(icon: Icons.zoom_out_map_outlined),
              IconWithCircle(icon: Icons.notifications_none_outlined),
              IconWithCircle(icon: Icons.person_2_outlined),
            ],
          ),
        ),
      ],
    );
  }
}
