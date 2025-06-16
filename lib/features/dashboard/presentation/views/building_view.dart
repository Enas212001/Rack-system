import 'package:flutter/material.dart';

import 'widget/building_view_body.dart';

class BuildingView extends StatelessWidget {
  const BuildingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: BuildingViewBody()));
  }
}


