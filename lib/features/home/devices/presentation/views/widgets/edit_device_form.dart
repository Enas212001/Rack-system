import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/widget/add_full_button.dart';
import 'package:flutter_application_1/features/auth/presentation/views/widgets/title_with_textfield.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditDeviceForm extends StatelessWidget {
  const EditDeviceForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Edit Device', style: CustomTextStyles.text14W500Primary),
          SizedBox(height: 20.h),
          TitleWithTextField(
            title: 'Switch ',
            controller: TextEditingController(),
          ),
          SizedBox(height: 10.h),
          TitleWithTextField(
            title: 'Port Number',
            controller: TextEditingController(),
          ),
          SizedBox(height: 10.h),
          TitleWithTextField(
            title: 'Device Name',
            controller: TextEditingController(),
          ),
          SizedBox(height: 10.h),
          TitleWithTextField(
            title: 'Device Serial',
            controller: TextEditingController(),
          ),
          SizedBox(height: 10.h),
          TitleWithTextField(
            title: 'MAC Address',
            controller: TextEditingController(),
          ),
          SizedBox(height: 10.h),
          TitleWithTextField(
            title: 'Device IP',
            controller: TextEditingController(),
          ),
          SizedBox(height: 10.h),
          TitleWithTextField(
            title: 'Patch Panel',
            controller: TextEditingController(),
          ),
          SizedBox(height: 10.h),
          TitleWithTextField(
            title: 'Product Number',
            controller: TextEditingController(),
          ),
          SizedBox(height: 10.h),
          TitleWithTextField(
            title: 'Device Model',
            controller: TextEditingController(),
          ),
          SizedBox(height: 40.h),
          AddFullSizeButton(onPressed: () {}, text: 'Save'),
        ],
      ),
    );
  }
}
