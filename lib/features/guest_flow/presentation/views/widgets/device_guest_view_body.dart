import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/widget/top_with_back.dart';
import 'package:flutter_application_1/features/guest_flow/presentation/views/widgets/device_body.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/switch_model/switch_item.dart';

class DeviceGuestViewBody extends StatelessWidget {
  const DeviceGuestViewBody({super.key, required this.switchItem});
  final SwitchItem switchItem;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
    );
  }
}
