import 'package:flutter/material.dart';
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
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
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
        border: InputBorder.none,
        hintText: hintText,
        filled: true,
        fillColor: Color(0xffEAEAE8),
      ),
    );
  }
}
