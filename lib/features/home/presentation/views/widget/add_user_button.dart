import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/features/home/presentation/manager/cubit/hotel_cubit.dart';
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
        color: Colors.black,
        width: 86.w,
        height: 19.h,
        alignment: Alignment.center,
        child: Text(
          '+Add User',
          style: Theme.of(
            context,
          ).textTheme.titleSmall!.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
