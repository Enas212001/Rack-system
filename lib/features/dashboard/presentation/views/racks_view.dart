import 'package:flutter/material.dart';
import 'widget/rack_view_body.dart';

class RacksView extends StatelessWidget {
  const RacksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RackViewBody(),
      ),
    );
  }
}
