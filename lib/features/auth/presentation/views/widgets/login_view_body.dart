import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'login_form.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 600), () {
      setState(() {
        opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.03.h),
            Align(
              alignment: Alignment.topCenter,
              child: Hero(
                tag: 'logo',
                child: Image.asset(Assets.imagesAppLogo),
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.06.h),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 800),
              opacity: opacity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Log In to your Account',
                    style: CustomTextStyles.text14W500Primary,
                  ),
                  const LoginForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
