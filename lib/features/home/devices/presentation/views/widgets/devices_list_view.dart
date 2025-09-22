import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/func/custom_toast.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/widget/custom_loading.dart';
import 'package:flutter_application_1/core/widget/lost_connection.dart';
import 'package:flutter_application_1/features/home/devices/presentation/manager/cubit/device_cubit.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'device_item_widget.dart';

class DevicesListView extends StatelessWidget {
  const DevicesListView({super.key, required this.switchId});

  final String switchId;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                'Device Name',
                style: CustomTextStyles.text14W500Primary,
              ),
            ),
            Divider(height: 1, color: AppColors.borderColor),
            BlocListener<DeviceCubit, DeviceState>(
              listener: (context, state) {
                if (state is DeviceDeleteSuccess) {
                  context.read<DeviceCubit>().getDevices(switchId: switchId);
                } else if (state is DeviceDeleteFailure) {
                  showToast(state.failure);
                }
              },
              child: BlocBuilder<DeviceCubit, DeviceState>(
                builder: (context, state) {
                  if (state is DeviceLoading) {
                    return CustomLoading();
                  } else if (state is DeviceFailure) {
                    return Center(
                      child:
                          state.failure ==
                              'Connection timed out. Please try again.'
                          ? LostConnection()
                          : Text(state.failure),
                    );
                  } else if (state is DeviceSuccess) {
                    if (state.devices.isEmpty) {
                      return const Center(child: Text('No devices found'));
                    }
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.devices.length,
                      itemBuilder: (context, index) =>
                          DeviceItemWidget(deviceItem: state.devices[index]),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
