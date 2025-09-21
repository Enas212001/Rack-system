import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/switch_model/switch_item.dart';
import 'package:flutter_application_1/features/home/devices/presentation/manager/cubit/device_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/device_guest_view_body.dart';

class DeviceGuestView extends StatelessWidget {
  const DeviceGuestView({super.key, required this.switchItem});
  final SwitchItem switchItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            DeviceCubit()..getDevices(switchId: switchItem.id!.toString()),
        child: DeviceGuestViewBody(switchItem: switchItem),
      ),
    );
  }
}
