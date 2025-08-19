import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/widget/add_full_button.dart';
import 'package:flutter_application_1/features/auth/presentation/views/widgets/title_with_textfield.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddSwitchForm extends StatelessWidget {
  const AddSwitchForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Add Switch', style: CustomTextStyles.text14W500Primary),
          SizedBox(height: 20.h),
          TitleWithTextField(
            title: 'Switch Name',
            controller: TextEditingController(),
          ),
          SizedBox(height: 10.h),
          TitleWithTextField(
            title: 'Serial Number',
            controller: TextEditingController(),
          ),
          SizedBox(height: 10.h),
          TitleWithTextField(
            title: 'Mac Address',
            controller: TextEditingController(),
          ),
          SizedBox(height: 10.h),
          TitleWithTextField(
            title: 'IP Adress',
            controller: TextEditingController(),
          ),
          SizedBox(height: 10.h),
          TitleWithTextField(
            title: 'Up link core 1',
            controller: TextEditingController(),
          ),
          SizedBox(height: 10.h),
          TitleWithTextField(
            title: 'Up link core 2',
            controller: TextEditingController(),
          ),
          SizedBox(height: 10.h),
          TitleWithTextField(
            title: 'Port number',
            controller: TextEditingController(),
          ),
          SizedBox(height: 10.h),
          TitleWithTextField(
            title: 'Model',
            controller: TextEditingController(),
          ),
          SizedBox(height: 40.h),
          AddFullSizeButton(onPressed: () {}, text: 'Save'),
        ],
      ),
    );
  }
}
