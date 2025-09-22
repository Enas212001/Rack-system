import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/func/custom_toast.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/core/widget/logout_widget.dart';
import 'package:flutter_application_1/features/auth/presentation/cubit/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'drawer_item.dart';

class GuestDrawer extends StatelessWidget {
  const GuestDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 230.w,
      backgroundColor: AppColors.scaffoldBackgroundColor,
      child: ListView(
        children: [
          SizedBox(height: 36.h),
          Image.asset(Assets.imagesAppLogo, height: 50.h),
          SizedBox(height: 36.h),
          BlocProvider(
            create: (context) => LoginCubit(),
            child: BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LogoutFailure) {
                  showToast(state.message);
                } else if (state is LogoutSuccess) {
                  context.go(AppRoutes.login);
                }
              },
              builder: (context, state) {
                return DrawerItem(
                  image: Assets.imagesLogOut,
                  title: 'Logout',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (dialogContext) {
                        return LogoutWidget(
                          onLogout: () {
                            context.read<LoginCubit>().logout();
                          },
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
