import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/core/utils/widget/item_detail.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SwitchGuestItemDetails extends StatelessWidget {
  const SwitchGuestItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.h),
        ItemDetail(label: 'Serial :', value: '100'),
        ItemDetail(label: 'MAC :', value: '100'),
        ItemDetail(label: 'IP :', value: '100'),
        ItemDetail(label: 'Port Num :', value: '100'),
        ItemDetail(label: 'Model :', value: '100'),
        ItemDetail(
          label: 'Action :',
          isAction: true,
          isSwitch: true,
          showReport: () {
            context.push(AppRoutes.report);
          },
        ),
      ],
    );
  }
}
