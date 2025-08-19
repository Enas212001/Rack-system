import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/widget/add_full_button.dart';
import 'package:flutter_application_1/features/auth/presentation/views/widgets/title_with_textfield.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddSummaryForm extends StatelessWidget {
  const AddSummaryForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Add Summary', style: CustomTextStyles.text14W500Primary),
          SizedBox(height: 20.h),
          TitleWithTextField(
            title: 'Select switch',
            controller: TextEditingController(),
          ),
          SizedBox(height: 10.h),
          TitleWithTextField(
            title: 'CCTV in',
            controller: TextEditingController(),
          ),
          SizedBox(height: 10.h),
          TitleWithTextField(
            title: 'CCTV out',
            controller: TextEditingController(),
          ),
          SizedBox(height: 10.h),
          TitleWithTextField(
            title: 'Ap Room',
            controller: TextEditingController(),
          ),
          SizedBox(height: 10.h),
          TitleWithTextField(
            title: 'Ap Out',
            controller: TextEditingController(),
          ),
          SizedBox(height: 40.h),
          AddFullSizeButton(onPressed: () {}, text: 'Save'),
        ],
      ),
    );
  }
}
