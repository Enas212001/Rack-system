import 'dart:convert';
import 'dart:developer';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/cache/cache_helper.dart';
import 'package:flutter_application_1/core/func/custom_toast.dart';
import 'package:flutter_application_1/core/utils/api_key.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/core/utils/service_locator.dart';
import 'package:flutter_application_1/features/auth/presentation/cubit/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'login_button.dart';
import 'remember_me_widget.dart';
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
          GoRouter.of(context).pushReplacement(AppRoutes.hotels);
          getIt.get<CacheHelper>().saveData(key: 'isLogin', value: true);
        }
      },
      builder: (context, state) {
        return Form(
          key: loginCubit.loginKey,
          child: Column(
            children: [
              SizedBox(height: 14.h),
              TypeAheadField<String>(
                suggestionsCallback: (pattern) {
                  final List<String> emails = List<String>.from(
                    getIt.get<CacheHelper>().getData(key: ApiKey.emailList) ??
                        [],
                  );
                  return emails
                      .where(
                        (email) => email.toLowerCase().startsWith(
                          pattern.toLowerCase(),
                        ),
                      )
                      .toList();
                },
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    title: Text(suggestion),
                    tileColor: AppColors.whiteColor,
                  );
                },
                onSelected: (suggestion) {
                  loginCubit.emailController.text = suggestion;
                  final String? jsonString = getIt.get<CacheHelper>().getData(
                    key: ApiKey.passwordsMap,
                  );
                  final Map<String, String> passwords = jsonString != null
                      ? Map<String, String>.from(jsonDecode(jsonString))
                      : {};
                  loginCubit.passwordController.text =
                      passwords[suggestion] ?? '';
                },
                builder: (context, controller, focusNode) {
                  return TitleWithTextField(
                    title: 'Email',
                    controller:
                        controller, // ✅ Use the provided controller here
                    focusNode: focusNode,
                    hintText: 'Enter your email',
                  );
                },
                emptyBuilder: (context) => const SizedBox.shrink(),
              ),
              SizedBox(height: 13.h),
              TitleWithTextField(
                title: 'Password',
                controller: loginCubit.passwordController,
                isPassword: true,
                hintText: 'Enter your password',
              ),
              SizedBox(height: 8.h),
              RememberMeWidget(),
              SizedBox(height: 50.h),
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
