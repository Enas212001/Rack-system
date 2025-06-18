import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/cache/cache_helper.dart';
import 'package:flutter_application_1/core/utils/service_locator.dart';
import 'package:flutter_application_1/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pushReplacement('/dashboard');
        BlocProvider.of<HomeCubit>(context).getBuildings();
        getIt.get<CacheHelper>().saveData(key: 'isLogin', value: true);
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
    );
  }
}
