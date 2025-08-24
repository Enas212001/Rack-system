import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/my_app_drawer.dart';

import 'widgets/report_guest_view_body.dart';

class ReportView extends StatelessWidget {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(drawer: MyAppDrawer(), body: ReportGuestViewBody());
  }
}
