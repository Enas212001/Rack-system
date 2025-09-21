import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/core/widget/add_text_button.dart';
import 'package:flutter_application_1/core/widget/tab_bar_item.dart';
import 'package:flutter_application_1/features/home/Buildings/data/models/building_model.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/manager/rack_cubit/rack_cubit.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/manager/switch_cubit/switch_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              TapBarItem(
                index: 0,
                title: "Racks",
                selected: selectedIndex == 0,
                onIndexChanged: onIndexChanged,
              ),
              SizedBox(width: 24.w),
              TapBarItem(
                index: 1,
                title: "Switches",
                selected: selectedIndex == 1,
                onIndexChanged: onIndexChanged,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: AddTextButton(
              title: selectedIndex == 0 ? '+ Add Rack' : '+ Add Switch',
              onTap: () async {
                if (selectedIndex == 0) {
                  GoRouter.of(context).push(
                    AppRoutes.addRack,
                    extra: AddRackArgs(
                      rackCubit: rackCubit,
                      buildingModel: buildingModel,
                    ),
                  );
                } else {
                  await GoRouter.of(
                    context,
                  ).push(AppRoutes.addSwitch, extra: buildingModel);
                  context.read<SwitchCubit>().getSwitchs(
                    hotelId: buildingModel.hotelId!,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
