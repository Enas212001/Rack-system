import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/cache/cache_helper.dart';
import 'package:flutter_application_1/core/func/custom_toast.dart';
import 'package:flutter_application_1/core/utils/service_locator.dart';
import 'package:flutter_application_1/features/auth/presentation/cubit/login_cubit.dart';
import 'package:flutter_application_1/features/home/presentation/manager/cubit/hotel_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'login_button.dart';
import 'title_with_textfield.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    LoginCubit loginCubit = BlocProvider.of<LoginCubit>(context);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          showToast(state.message);
          log(state.message);
        } else if (state is LoginSuccess) {
          GoRouter.of(context).pushReplacement('/dashboard');
          context.read<HotelCubit>().getHotels();
          getIt.get<CacheHelper>().saveData(key: 'isLogin', value: true);
        }
      },
      builder: (context, state) {
        return Form(
          key: loginCubit.loginKey,
          child: Column(
            children: [
              SizedBox(height: 14.h),
              TitleWithTextField(
                title: 'UserName',
                controller: loginCubit.emailController,
              ),
              SizedBox(height: 13.h),
              TitleWithTextField(
                title: 'Password',
                controller: loginCubit.passwordController,
              ),
              SizedBox(height: 8.h),
              Row(children: [Checkbox(value: false, onChanged: (value) {})]),
              // BlocBuilder<LoginCubit, LoginState>(
              //   buildWhen: (previous, current) =>
              //       current is LoginCheckboxChanged || current is LoginInitial,
              //   builder: (context, state) {
              //     final cubit = context.watch<LoginCubit>();
              //     return Row(
              //       children: [
              //         Checkbox(
              //           value: cubit.rememberMe,
              //           onChanged: cubit.toggleRememberMe,
              //         ),
              //         const Text('Remember Me'),
              //       ],
              //     );
              //   },
              // ),
              SizedBox(height: 28.h),
              LoginButton(
                onTap: () {
                  if (loginCubit.loginKey.currentState!.validate()) {
                    loginCubit.login();
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
