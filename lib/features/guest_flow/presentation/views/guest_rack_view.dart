import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/my_app_drawer.dart';
import 'package:flutter_application_1/features/home/Buildings/data/models/building_model.dart';

import 'widgets/guest_rack_view_body.dart';

class GuestRackView extends StatelessWidget {
  const GuestRackView({super.key, required this.building});
  final BuildingModel building;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyAppDrawer(),
      body: GuestRackViewBody(building: building),
    );
  }
}
