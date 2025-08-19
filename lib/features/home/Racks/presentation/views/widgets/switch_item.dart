import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/core/utils/widget/expand_info_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'switch_details.dart';

class SwitchItem extends StatelessWidget {
  const SwitchItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRoutes.device);
          },
          child: Padding(
            padding: EdgeInsets.all(12.r),
            child: ExpandableInfoCard(
              title: 'Switch Name',
              details: SwitchDetails(),
            ),
          ),
        ),
      ],
    );
  }
}
