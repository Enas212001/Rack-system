import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/features/home/Buildings/presentation/cubit/building_cubit.dart';
import 'package:flutter_application_1/features/home/Hotels/data/models/hotel_model.dart';
import 'package:flutter_application_1/features/home/widget/add_text_button.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BuildingInfo extends StatelessWidget {
  const BuildingInfo({super.key, required this.hotelModel});
  final HotelModel hotelModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => GoRouter.of(context).pop(),
                child: Text(
                  hotelModel.name![0].toUpperCase() +
                      hotelModel.name!.substring(1).toLowerCase(),
                  style: CustomTextStyles.text14Regular.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              Spacer(),
              AddTextButton(
                title: '+ Add Building',
                onTap: () {
                  final buildingCubit = context.read<BuildingCubit>();
                  GoRouter.of(context).push(
                    AppRoutes.addBuilding,
                    extra: AddBuildingArgs(
                      hotel: hotelModel,
                      buildingCubit: buildingCubit,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
