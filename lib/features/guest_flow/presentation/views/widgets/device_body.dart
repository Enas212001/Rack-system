import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/widget/custom_loading.dart';
import 'package:flutter_application_1/features/home/devices/presentation/manager/cubit/device_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'device_guest_item.dart';

class DeviceBody extends StatelessWidget {
  const DeviceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeviceCubit, DeviceState>(
      builder: (context, state) {
        if (state is DeviceSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return DeviceGuetItem(deviceItem: state.devices[index]);
            }, childCount: state.devices.length),
          );
        } else if (state is DeviceFailure) {
          return SliverToBoxAdapter(child: Center(child: Text(state.failure)));
        } else if (state is DeviceLoading) {
          return SliverToBoxAdapter(child: CustomLoading());
        }
        return SliverToBoxAdapter();
      },
    );
  }
}
