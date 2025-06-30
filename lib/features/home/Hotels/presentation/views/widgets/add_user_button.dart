import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/features/home/Hotels/cubit/hotel_cubit.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AddUserButton extends StatelessWidget {
  const AddUserButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final hotelCubit = context.read<HotelCubit>();
        GoRouter.of(context).push(AppRoutes.addHotel, extra: hotelCubit);
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.r),
        child: Text(
          '+ Add User',
          style: CustomTextStyles.text12RegularGrey.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
