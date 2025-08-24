import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/func/custom_toast.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/features/users/presentation/manager/cubit/user_cubit.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'user_item_widget.dart';

class UserListView extends StatelessWidget {
  const UserListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocListener<UserCubit, UserState>(
        listener: (context, state) {
          if (state is UserDeleteSuccess) {
            context.read<UserCubit>().getUsersInfo();
          } else if (state is UserDeleteError) {
            showToast(state.message);
            log(state.message);
          }
        },
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserSuccess) {
              return Padding(
                padding: EdgeInsets.all(16.r),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.borderColor,
                      width: 1.r,
                    ),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.r,
                          vertical: 12.r,
                        ),
                        width: double.infinity,
                        color: AppColors.backgroundColor,
                        child: Text(
                          'Name',
                          style: CustomTextStyles.text14W500Primary,
                        ),
                      ),
                      Divider(height: 1, color: AppColors.borderColor),
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.userModel.length,
                        itemBuilder: (context, index) => Column(
                          children: [
                            UserItemWidget(userModel: state.userModel[index]),
                            if (index < state.userModel.length - 1)
                              const Divider(
                                height: 1,
                                color: AppColors.borderColor,
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is UserError) {
              return Center(child: Text(state.message));
            } else if (state is UserLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
