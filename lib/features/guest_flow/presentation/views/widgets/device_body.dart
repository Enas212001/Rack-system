import 'package:flutter/material.dart';

import 'device_guest_item.dart';

class DeviceBody extends StatelessWidget {
  const DeviceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return DeviceGuetItem();
      }, childCount: 10),
    );
  }
}
