import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'login_button.dart';
import 'title_with_textfield.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(height: 14.h),
          TitleWithTextField(title: 'UserName'),
          SizedBox(height: 13.h),
          TitleWithTextField(title: 'Password'),
          SizedBox(height: 8.h),
          Row(
            children: [
              Checkbox(value: false, onChanged: (value) {}),
              Text('Remember Me'),
            ],
          ),
          SizedBox(height: 28.h),
          LoginButton(),
        ],
      ),
    );
  }
}
