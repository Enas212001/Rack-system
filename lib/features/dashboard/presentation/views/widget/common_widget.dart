import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              IconWithBorder(icon: Icons.zoom_out_map_outlined),
              IconWithBorder(icon: Icons.notifications_none_outlined),
              IconWithBorder(icon: Icons.person_2_outlined),
            ],
          ),
        ),
      ],
    );
  }
}
