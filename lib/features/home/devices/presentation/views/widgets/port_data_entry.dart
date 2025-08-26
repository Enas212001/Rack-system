import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'port_text_field.dart';

class PortDataEntry extends StatelessWidget {
  final int portNumber;
  final Map<String, TextEditingController> controllers;

  const PortDataEntry({
    super.key,
    required this.portNumber,
    required this.controllers,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor, width: 1.r),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Port $portNumber',
            style: CustomTextStyles.text14W500Primary.copyWith(
              color: AppColors.lightGreyColor,
            ),
          ),
          PortTextField(
            controller: controllers['name']!,
            hintText: 'Device Name',
          ),
          PortTextField(
            controller: controllers['serial']!,
            hintText: 'Device Serial',
          ),
          PortTextField(
            controller: controllers['mac']!,
            hintText: 'MAC Address',
          ),
          PortTextField(controller: controllers['ip']!, hintText: 'IP Address'),
          PortTextField(
            controller: controllers['patch']!,
            hintText: 'Patch Panel',
          ),
          PortTextField(
            controller: controllers['product']!,
            hintText: 'Product Number',
          ),
          PortTextField(
            controller: controllers['model']!,
            hintText: 'Device Model',
          ),
        ],
      ),
    );
  }
}
