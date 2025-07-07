import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/core/utils/app_strings.dart';
import 'package:flutter_application_1/features/home/widget/custom_list_tile.dart';

class BuildingItem extends StatelessWidget {
  const BuildingItem({super.key, required this.building});
  final String building;
  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      image: Assets.imagesBuilding,
      title: AppStrings.building,
      subTitle: building,
    );
  }
}
