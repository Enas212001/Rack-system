import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_auth_text_field.dart';

class TitleWithTextField extends StatelessWidget {
  const TitleWithTextField({
    super.key,
    required this.title,
    this.controller,
    this.hintText,
    this.isPassword = false,
    this.value,
    this.onChanged,
  });
  final String title;
  final TextEditingController? controller;
  final String? hintText, value;
  final bool isPassword;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: CustomTextStyles.text12RegularText),
        SizedBox(height: 8.h),
        CustomTextFormField(
          controller: controller,
          title: title,
          hintText: hintText,
          value: value,
          isPassword: isPassword,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
