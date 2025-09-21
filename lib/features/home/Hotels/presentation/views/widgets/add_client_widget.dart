import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/core/utils/app_strings.dart';
import 'package:flutter_application_1/features/home/Hotels/presentation/cubit/hotel_cubit.dart';
import 'package:flutter_application_1/core/widget/add_text_button.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddClientWidget extends StatelessWidget {
  const AddClientWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AppStrings.ourClients,
          style: CustomTextStyles.text16MeduimText.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
        Spacer(),
        AddTextButton(
          title: '+ Add Hotel',
          onTap: () {
            final hotelCubit = context.read<HotelCubit>();
            GoRouter.of(context).push(AppRoutes.addHotel, extra: hotelCubit);
          },
        ),
      ],
    );
  }
}
