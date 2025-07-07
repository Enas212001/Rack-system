import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/core/utils/app_strings.dart';
import 'package:flutter_application_1/features/home/widget/custom_list_tile.dart';

class RackItem extends StatelessWidget {
  const RackItem({super.key, required this.rackId, required this.buildingRId});
  final String rackId, buildingRId;
  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      title: AppStrings.rack,
      subTitle: '$rackId  $buildingRId',
      image: Assets.imagesRack,
    );
  }
}
