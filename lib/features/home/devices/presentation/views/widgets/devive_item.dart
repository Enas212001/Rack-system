import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/core/utils/widget/expand_info_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'device_details.dart';

class DeviveItem extends StatelessWidget {
  const DeviveItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRoutes.deviceDetails);
          },
          child: Padding(
            padding: EdgeInsets.all(12.r),
            child: ExpandableInfoCard(title: 'Port', details: DeviceDetails()),
          ),
        ),
      ],
    );
  }
}
