import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleWithTextField extends StatelessWidget {
  const TitleWithTextField({
    super.key,
    required this.title,
    required this.controller,
  });
  final String title;
  final TextEditingController controller;
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
        TextFormField(
          controller: controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter $title';
            }
            return null;
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            filled: true,
            fillColor: Color(0xffEAEAE8),
          ),
        ),
      ],
    );
  }
}
