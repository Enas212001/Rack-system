import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/func/custom_show_dialog.dart';
import 'package:flutter_application_1/core/func/custom_toast.dart';
import 'package:flutter_application_1/core/utils/widget/add_full_button.dart';
import 'package:flutter_application_1/core/utils/widget/success_message.dart';
import 'package:flutter_application_1/features/auth/presentation/views/widgets/title_with_textfield.dart';
import 'package:flutter_application_1/features/users/presentation/manager/cubit/user_cubit.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddUserForm extends StatelessWidget {
  const AddUserForm({super.key});

  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserCubit>();
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserAddSuccess) {
          customShowDialog(
            context,
            widget: SuccessMessage(messageName: 'user'),
          );
        } else if (state is UserAddError) {
          showToast(state.message);
          log(state.message);
        }
      },
      builder: (context, state) {
        return Form(
          key: userCubit.formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Create new user',
                  style: CustomTextStyles.text14W500Primary,
                ),
                SizedBox(height: 20.h),
                TitleWithTextField(
                  title: 'Full name',
                  controller: userCubit.nameController,
                  hintText: 'Enter Full name',
                ),
                SizedBox(height: 10.h),
                TitleWithTextField(
                  title: 'Email address',
                  controller: userCubit.emailController,
                  hintText: 'Enter Email address',
                ),
                SizedBox(height: 10.h),
                TitleWithTextField(
                  title: 'Password',
                  controller: userCubit.passwordController,
                  hintText: 'Enter Password',
                ),
                SizedBox(height: 10.h),
                TitleWithTextField(
                  title: 'Role',
                  controller: userCubit.roleIdController,
                  hintText: 'Enter Role',
                ),
                SizedBox(height: 60.h),
                AddFullSizeButton(
                  onPressed: () {
                    if (userCubit.formKey.currentState!.validate()) {
                      userCubit.addUsersInfo();
                    }
                  },
                  text: 'Save',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
