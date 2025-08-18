import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/core/utils/app_strings.dart';
import 'package:flutter_application_1/core/utils/widget/delete_widget.dart';
import 'package:flutter_application_1/core/utils/widget/expand_info_card.dart';
import 'package:flutter_application_1/core/utils/widget/item_detail.dart';
import 'package:flutter_application_1/features/home/Buildings/data/models/building_model.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/rack_info_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RackItem extends StatelessWidget {
  const RackItem({
    super.key,
    required this.rackInfoModel,
    required this.buildingModel,
  });
  final RackInfoModel rackInfoModel;
  final BuildingModel buildingModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.r),
      child: ExpandableInfoCard(
        title: AppStrings.rack,
        details: RackDetails(
          rackInfoModel: rackInfoModel,
          buildingModel: buildingModel,
        ),
      ),
    );
  }
}

class RackDetails extends StatelessWidget {
  const RackDetails({
    super.key,
    required this.rackInfoModel,
    required this.buildingModel,
  });
  final RackInfoModel rackInfoModel;
  final BuildingModel buildingModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemDetail(label: 'Size', value: '10'),
          ItemDetail(label: 'Model', value: rackInfoModel.productModel),
          ItemDetail(label: 'Building', value: buildingModel.buildingName),
          ItemDetail(
            label: 'Actions',
            isAction: true,
            onEdit: () {
              GoRouter.of(context).go(AppRoutes.editRack);
            },
            onDelete: () {
              showDialog(
                context: context,
                builder: (dialogContext) => DeleteWidget(
                  onDelete: () {
                    Navigator.pop(context);
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
