import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/switch_model/switch_item.dart';

import 'widgets/report_guest_view_body.dart';

class ReportView extends StatelessWidget {
  const ReportView({super.key, required this.switchItem});
  final SwitchItem switchItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ReportGuestViewBody(switchItem: switchItem));
  }
}
