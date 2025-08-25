import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/core/utils/widget/expand_info_card.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/switch_model/switch_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'switch_details.dart';

class SwitchItemWidget extends StatelessWidget {
  const SwitchItemWidget({super.key, required this.switchItem});
  final SwitchItem switchItem;
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
              title: switchItem.name!,
              details: SwitchDetails(switchItem: switchItem),
            ),
          ),
        ),
      ],
    );
  }
}
