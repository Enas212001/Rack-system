import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                Assets.imagesRackBack, 
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 33.w, vertical: 8.h),
                color: Colors.white,
                width: 347.w,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/PowerSMTPLogo.png',
                      width: 74.w,
                      height: 74.h,
                    ),
                    SizedBox(height: 16.h),
                    Image.asset(
                      'assets/images/Logoblack.png',
                      width: 114.w,
                      height: 45.h,
                    ),
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
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).pushReplacement('/dashboard');
                      },
                      child: Container(
                        color: Color(0xff4C90CD),
                        width: 195.w,
                        height: 51.h,
                        alignment: Alignment.center,
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TitleWithTextField extends StatelessWidget {
  const TitleWithTextField({super.key, required this.title});
  final String title;
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
        TextField(
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
