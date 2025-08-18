import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/widget/add_full_button.dart';
import 'package:flutter_application_1/features/auth/presentation/views/widgets/title_with_textfield.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddUserForm extends StatelessWidget {
  const AddUserForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Create new user', style: CustomTextStyles.text14W500Primary),
            SizedBox(height: 20.h),
            TitleWithTextField(
              title: 'Full name',
              controller: TextEditingController(),
              hintText: 'Enter Full name',
            ),
            SizedBox(height: 10.h),
            TitleWithTextField(
              title: 'Email address',
              controller: TextEditingController(),
              hintText: 'Enter Email address',
            ),
            SizedBox(height: 10.h),
            TitleWithTextField(
              title: 'Password',
              controller: TextEditingController(),
              hintText: 'Enter Password',
            ),
            SizedBox(height: 10.h),
            TitleWithTextField(
              title: 'Role',
              controller: TextEditingController(),
              hintText: 'Enter Role',
            ),
            SizedBox(height: 60.h),
            AddFullSizeButton(onPressed: () {}, text: 'Save'),
          ],
        ),
      ),
    );
  }
}
