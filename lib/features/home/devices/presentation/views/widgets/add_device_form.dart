import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/func/border_text_field.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/widget/add_full_button.dart';
import 'package:flutter_application_1/features/auth/presentation/views/widgets/title_with_textfield.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddDeviceForm extends StatelessWidget {
  const AddDeviceForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Add Device', style: CustomTextStyles.text14W500Primary),
          SizedBox(height: 20.h),
          TitleWithTextField(
            title: 'Select switch',
            controller: TextEditingController(),
          ),
          SizedBox(height: 10.h),
          PortDataEntry(),
          SizedBox(height: 40.h),
          AddFullSizeButton(onPressed: () {}, text: 'Save'),
        ],
      ),
    );
  }
}

class PortDataEntry extends StatelessWidget {
  const PortDataEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor, width: 1.r),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Port 1',
            style: CustomTextStyles.text14W500Primary.copyWith(
              color: AppColors.lightGreyColor,
            ),
          ),
          PortTextField(hintText: 'Device Name'),
          PortTextField(hintText: 'Device Serial'),
          PortTextField(hintText: 'MAC Address'),
          PortTextField(hintText: 'IP Address'),
          PortTextField(hintText: 'Patch Panel'),
          PortTextField(hintText: 'Product Number'),
          PortTextField(hintText: 'Device Model'),
        ],
      ),
    );
  }
}

class PortTextField extends StatelessWidget {
  const PortTextField({super.key, required this.hintText});
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: SizedBox(
        height: 40.h,
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a value';
            }
            return null;
          },
          controller: TextEditingController(),
          decoration: InputDecoration(
            border: borderTextField(),
            focusedBorder: borderTextField(),
            enabledBorder: borderTextField(),
            hintText: hintText,
            hintStyle: CustomTextStyles.text14Regular.copyWith(
              color: AppColors.lightGreyColor,
            ),
          ),
        ),
      ),
    );
  }
}
