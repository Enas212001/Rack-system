import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/widget/top_with_back.dart';
import 'package:flutter_application_1/features/guest_flow/presentation/views/widgets/device_body.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/switch_model/switch_item.dart';
import 'package:flutter_application_1/features/home/devices/presentation/manager/cubit/device_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeviceGuestViewBody extends StatelessWidget {
  const DeviceGuestViewBody({super.key, required this.switchItem});
  final SwitchItem switchItem;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: AppColors.primaryColor,
      color: AppColors.whiteColor,
      onRefresh: () async {
        context.read<DeviceCubit>().getDevices(
          switchId: switchItem.id!.toString(),
        );
      },
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: TopWithBack(
              text: 'Devices for switch: ${switchItem.name}',
              noSearch: true,
              withDrawer: false,
            ),
          ),
          DeviceBody(),
        ],
      ),
    );
  }
}
