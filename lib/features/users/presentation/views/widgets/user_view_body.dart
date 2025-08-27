import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/widget/top_with_back.dart';
import 'package:flutter_application_1/features/users/presentation/manager/cubit/user_cubit.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'user_list_view.dart';

class UserViewBody extends StatelessWidget {
  const UserViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<UserCubit>().getUsersInfo(),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: TopWithBack(
              title: 'Users',
              text: 'Users',
              onSearchChanged: (value) =>
                  context.read<UserCubit>().searchUser(value),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 16.r) +
                  EdgeInsets.only(top: 16.h),
              child: Text(
                'All User',
                style: CustomTextStyles.text14Regular.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
          UserListView(),
        ],
      ),
    );
  }
}
