import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_strings.dart';
import 'package:flutter_application_1/core/utils/widget/expand_info_card.dart';
import 'package:flutter_application_1/core/utils/widget/item_detail.dart';
import 'package:flutter_application_1/features/home/Buildings/data/models/building_model.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwitchListView extends StatelessWidget {
  const SwitchListView({super.key, required this.buildingModel});
  final BuildingModel buildingModel;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.borderColor, width: 1.r),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 12.r),
                width: double.infinity,
                color: AppColors.backgroundColor,
                child: Text(
                  'Switch Name',
                  style: CustomTextStyles.text14W500Primary,
                ),
              ),
              Divider(height: 1, color: AppColors.borderColor),
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 7,
                itemBuilder: (context, index) => SwitchItem(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SwitchItem extends StatelessWidget {
  const SwitchItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.all(12.r),
            child: ExpandableInfoCard(
              title: AppStrings.rack,
              details: SwitchDetails(),
            ),
          ),
        ),
      ],
    );
  }
}

class SwitchDetails extends StatelessWidget {
  const SwitchDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemDetail(label: 'Serial', value: '101'),
          ItemDetail(label: 'MAC', value: '1'),
          ItemDetail(label: 'IP', value: '2'),
          ItemDetail(label: 'Portal Number', value: '2'),
          ItemDetail(label: 'Model', value: '2'),
          ItemDetail(label: 'Actions', isAction: true, isSwitch: true),
        ],
      ),
    );
  }
}
