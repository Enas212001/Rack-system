import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/core/utils/widget/add_text_button.dart';
import 'package:flutter_application_1/features/home/Buildings/data/models/building_model.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/cubit/rack_cubit.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RackSwitchWidget extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onIndexChanged;
  final RackCubit rackCubit;
  final BuildingModel buildingModel;

  const RackSwitchWidget({
    super.key,
    required this.selectedIndex,
    required this.onIndexChanged,
    required this.rackCubit,
    required this.buildingModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 16.r) + EdgeInsets.only(top: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _buildTab("Racks", 0, selectedIndex == 0),
              SizedBox(width: 24.w),
              _buildTab("Switches", 1, selectedIndex == 1),
            ],
          ),
          AddTextButton(
            title: selectedIndex == 0 ? '+ Add Rack' : '+ Add Switch',
            onTap: () {
              if (selectedIndex == 0) {
                
                GoRouter.of(context).push(
                  AppRoutes.addRack,
                  extra: AddRackArgs(
                    rackCubit: rackCubit,
                    buildingModel: buildingModel,
                  ),
                );
              } else {
                
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String title, int index, bool selected) {
    return GestureDetector(
      onTap: () => onIndexChanged(index),
      child: Column(
        children: [
          Text(
            title,
            style: CustomTextStyles.text14W500Primary.copyWith(
              color: selected
                  ? AppColors.primaryColor
                  : AppColors.lightGreyColor,
            ),
          ),
          SizedBox(height: 4.h),
          Container(
            height: 2.h,
            width: 40.w,
            decoration: BoxDecoration(
              color: selected ? AppColors.primaryColor : Colors.transparent,
              borderRadius: BorderRadius.circular(1),
            ),
          ),
        ],
      ),
    );
  }
}
