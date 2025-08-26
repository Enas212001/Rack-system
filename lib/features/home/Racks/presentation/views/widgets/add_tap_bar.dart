import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/core/utils/widget/add_text_button.dart';
import 'package:flutter_application_1/features/home/Buildings/data/models/building_model.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/manager/rack_cubit/rack_cubit.dart';
import 'package:go_router/go_router.dart';

class AddTapBar extends StatelessWidget {
  const AddTapBar({
    super.key,
    required this.selectedIndex,
    required this.rackCubit,
    required this.buildingModel,
  });

  final int selectedIndex;
  final RackCubit rackCubit;
  final BuildingModel buildingModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AddTextButton(
          title: selectedIndex == 0 ? '+ Add Switch' : '+ Add Rack',
          isRack: true,
          onTap: () {
            if (selectedIndex == 0) {
              GoRouter.of(
                context,
              ).push(AppRoutes.addSwitch, extra: buildingModel);
            } else {
              GoRouter.of(context).push(
                AppRoutes.addRack,
                extra: AddRackArgs(
                  rackCubit: rackCubit,
                  buildingModel: buildingModel,
                ),
              );
            }
          },
        ),
        AddTextButton(
          title: '+ Add Device',
          isRack: true,
          onTap: () => context.push(AppRoutes.addDevice),
        ),
        AddTextButton(
          title: '+ Add Summary',
          isRack: true,
          onTap: () => context.push(AppRoutes.addSummary),
        ),
      ],
    );
  }
}
