import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/func/border_text_field.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PortTextField extends StatelessWidget {
  const PortTextField({
    super.key,
    required this.hintText,
    required this.initialValue,
    required this.onChanged,
  });

  final String hintText;
  final String initialValue;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: SizedBox(
        height: 40.h,
        child: TextFormField(
          initialValue: initialValue,
          onChanged: onChanged,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a value';
            }
            return null;
          },
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
