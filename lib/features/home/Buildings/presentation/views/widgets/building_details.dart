import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/features/home/Buildings/data/models/building_model.dart';
import 'package:flutter_application_1/features/home/widget/delete_widget.dart';
import 'package:flutter_application_1/features/home/widget/item_detail.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BuildingDetails extends StatelessWidget {
  const BuildingDetails({super.key, required this.building});

  final BuildingModel building;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemDetail(label: 'Hotel ID', value: building.hotelId),
          ItemDetail(label: 'Rack ID', value: building.rackId),
          ItemDetail(label: 'Building Rack ID', value: building.buildingRId),
          ItemDetail(
            label: 'Actions',
            isAction: true,
            onEdit: () {
              GoRouter.of(context).push(AppRoutes.editBuilding);
            },
            onDelete: () {
              showDialog(
                context: context,
                builder: (dialogContext) => DeleteWidget(
                  onDelete: () {
                    Navigator.pop(context);
                  },
                  title: 'Building',
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
