import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/core/widget/delete_widget.dart';
import 'package:flutter_application_1/core/widget/item_detail.dart';
import 'package:flutter_application_1/features/home/Buildings/data/models/building_model.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/rack_model/rack_item.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/manager/rack_cubit/rack_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'rack_switch_details.dart';

class RackDetails extends StatelessWidget {
  const RackDetails({
    super.key,
    required this.rackInfoModel,
    required this.buildingModel,
  });
  final RackItem rackInfoModel;
  final BuildingModel buildingModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemDetail(label: 'Size', value: rackInfoModel.rackSize.toString()),
          ItemDetail(label: 'Model', value: rackInfoModel.rackModel),
          ItemDetail(label: 'Building', value: buildingModel.buildingName),
          ItemDetail(
            label: 'Actions',
            isAction: true,
            isRack: true,
            showRackDetails: () {
              showDialog(
                context: context,
                builder: (context) {
                  return RackSwitchDetails(rackInfoModel: rackInfoModel);
                },
              );
            },
            onEdit: () async {
              await GoRouter.of(
                context,
              ).push(AppRoutes.editRack, extra: rackInfoModel);
              context.read<RackCubit>().getRacksInfo(
                buildingId: buildingModel.id!,
              );
            },
            onDelete: () {
              showDialog(
                context: context,
                builder: (dialogContext) => DeleteWidget(
                  onDelete: () {
                    Navigator.pop(context);
                    context.read<RackCubit>().deleteRack(rack: rackInfoModel);
                  },
                  title: 'Rack',
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
