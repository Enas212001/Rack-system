import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/func/border_text_field.dart';
import 'package:flutter_application_1/core/func/custom_toast.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/core/utils/widget/add_full_button.dart';
import 'package:flutter_application_1/features/auth/presentation/views/widgets/title_with_textfield.dart';
import 'package:flutter_application_1/features/home/Hotels/data/models/hotel_model.dart';
import 'package:flutter_application_1/features/users/presentation/manager/cubit/user_cubit.dart';
import 'package:flutter_application_1/features/users/presentation/views/widgets/hotels_drop_down.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AddUserForm extends StatefulWidget {
  const AddUserForm({super.key});

  @override
  State<AddUserForm> createState() => _AddUserFormState();
}

class _AddUserFormState extends State<AddUserForm> {
  String? selectedRole; // "admin" or "user"
  HotelModel? selectedHotel;

  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserCubit>();

    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserAddSuccess) {
          context.pushReplacement(AppRoutes.users);
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
                  isPassword: true,
                ),
                SizedBox(height: 10.h),
                DropdownButtonFormField<String>(
                  initialValue: userCubit.roleId,
                  decoration: InputDecoration(
                    labelText: 'Role',
                    border: borderTextField(),
                    enabledBorder: borderTextField(),
                    focusedBorder: borderTextField(),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'admin', child: Text('Admin')),
                    DropdownMenuItem(value: 'user', child: Text('User')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedRole = value;
                      userCubit.roleId = value ?? '';
                      if (value != 'user') {
                        selectedHotel = null;
                      }
                    });
                  },
                  validator: (value) =>
                      value == null ? 'Please select a role' : null,
                ),
                if (selectedRole == 'user') ...[
                  SizedBox(height: 10.h),
                  HotelsDropDown(
                    value: userCubit.hotelId,
                    onChanged: (hotel) {
                      setState(() {
                        userCubit.hotelId = hotel;
                      });
                    },
                  ),
                ],
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
