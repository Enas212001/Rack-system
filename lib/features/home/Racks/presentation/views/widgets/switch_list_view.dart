import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/widget/custom_loading.dart';
import 'package:flutter_application_1/core/widget/empty_widget.dart';
import 'package:flutter_application_1/core/widget/lost_connection.dart';
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
    return SliverFillRemaining(
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: BlocBuilder<SwitchCubit, SwitchState>(
          builder: (context, state) {
            if (state is SwitchSuccess) {
              final switches = state.switches;
              if (switches.isEmpty) {
                return const EmptyWidget(text: 'Switches');
              }
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderColor, width: 1.r),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.r,
                        vertical: 12.r,
                      ),
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
                      itemCount: switches.length,
                      itemBuilder: (context, index) =>
                          SwitchItemWidget(switchItem: switches[index]),
                    ),
                  ],
                ),
              );
            } else if (state is SwitchLoading) {
              return const CustomLoading();
            } else if (state is SwitchFailure) {
              return Center(
                child:
                    state.message == 'Connection timed out. Please try again.'
                    ? const LostConnection()
                    : Text(state.message),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
