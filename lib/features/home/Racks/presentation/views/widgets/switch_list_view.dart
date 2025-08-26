import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/features/home/Buildings/data/models/building_model.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/manager/switch_cubit/switch_cubit.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'switch_item_widget.dart';

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
              BlocBuilder<SwitchCubit, SwitchState>(
                builder: (context, state) {
                  if (state is SwitchSuccess) {
                    final switchs = state.switches;
                    if (switchs.isEmpty) {
                      return Center(
                        child: Padding(
                          padding: EdgeInsets.all(16.r),
                          child: Text(
                            'No switchs available',
                            style: CustomTextStyles.text14W500Primary,
                          ),
                        ),
                      );
                    }
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.switches.length,
                      itemBuilder: (context, index) =>
                          SwitchItemWidget(switchItem: state.switches[index]),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
