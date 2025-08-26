import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/widget/custom_loading.dart';
import 'package:flutter_application_1/features/home/devices/presentation/manager/cubit/device_cubit.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'devices_connected_to_switch_item.dart';

class DevicesConnectedToSwitch extends StatelessWidget {
  const DevicesConnectedToSwitch({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderColor, width: 1.r),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: BlocBuilder<DeviceCubit, DeviceState>(
          builder: (context, state) {
            if (state is DeviceSuccess) {
              return Column(
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
                      'Device Name',
                      style: CustomTextStyles.text14W500Primary,
                    ),
                  ),
                  Divider(height: 1, color: AppColors.borderColor),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.devices.length,
                    itemBuilder: (context, index) =>
                        DevicesConnectedToSwitchItem(
                          deviceItem: state.devices[index],
                        ),
                  ),
                ],
              );
            } else if (state is DeviceFailure) {
              return Center(child: Text(state.failure));
            } else if (state is DeviceLoading) {
              return CustomLoading();
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
