import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/core/utils/widget/item_detail.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DeviceDetails extends StatelessWidget {
  const DeviceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemDetail(label: 'Serial', value: '101'),
          ItemDetail(label: 'MAC', value: '1'),
          ItemDetail(label: 'IP', value: '2'),
          ItemDetail(label: 'Patch Panel', value: '2'),
          ItemDetail(label: 'Product Number', value: '2'),
          ItemDetail(label: 'Model', value: '2'),
          ItemDetail(
            label: 'Actions',
            isAction: true,
            onEdit: () {
              GoRouter.of(context).push(AppRoutes.editDevice);
            },
          ),
        ],
      ),
    );
  }
}
