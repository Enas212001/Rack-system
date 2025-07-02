import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleWithTextField extends StatelessWidget {
  const TitleWithTextField({
    super.key,
    required this.title,
    required this.controller,
    this.hintText,
    this.isPassword = false,
    this.focusNode,
  });
  final String title;
  final TextEditingController controller;
  final String? hintText;
  final bool isPassword;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: CustomTextStyles.text14Regular.copyWith(
            color: AppColors.textColor,
          ),
        ),
        SizedBox(height: 8.h),
        CustomTextFormField(
          controller: controller,
          title: title,
          hintText: hintText,
          isPassword: isPassword,
          focusNode: focusNode,
        ),
      ],
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.title,
    this.hintText,
    this.isPassword = false,
    this.focusNode,
  });

  final TextEditingController controller;
  final String title;
  final String? hintText;
  final bool isPassword;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.primaryColor,
      enableSuggestions: true,
      focusNode: focusNode,
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $title';
        }
        return null;
      },
      obscureText: isPassword,

      decoration: InputDecoration(
        border: borderTextField(),
        focusedBorder: borderTextField(),
        enabledBorder: borderTextField(),

        hintText: hintText,
        hintStyle: CustomTextStyles.text14Regular.copyWith(
          color: AppColors.textColor,
        ),
      ),
    );
  }

  OutlineInputBorder borderTextField() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(color: AppColors.darkBlueColor, width: 1.w),
    );
  }
}
