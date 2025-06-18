import 'package:flutter/material.dart';
import 'widget/rack_info_view_body.dart';

class RackInfoView extends StatelessWidget {
  const RackInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: RackInfoViewBody()));
  }
}
