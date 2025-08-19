import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/my_app_drawer.dart';

import 'widgets/guest_building_view_body.dart';

class GuestBuildingView extends StatelessWidget {
  const GuestBuildingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(drawer: MyAppDrawer(), body: GuestBuildingViewBody());
  }
}
