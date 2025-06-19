import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Color(0xff4C90CD),
        width: 195.w,
        height: 51.h,
        alignment: Alignment.center,
        child: Text('LOGIN', style: CustomTextStyles.text16Bold),
      ),
    );
  }
}
