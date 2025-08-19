import 'package:flutter/material.dart';

import 'widgets/device_details_view_body.dart';

class DeviceDetailsView extends StatelessWidget {
  const DeviceDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: DeviceDetailsViewBody()));
  }
}
