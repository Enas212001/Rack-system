import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/my_app_drawer.dart';

import 'widgets/guest_rack_view_body.dart';

class GuestRackView extends StatelessWidget {
  const GuestRackView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(drawer: MyAppDrawer(), body: GuestRackViewBody());
  }
}
