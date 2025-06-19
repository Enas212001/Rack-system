import 'package:flutter/material.dart';
import 'widget/rack_info_view_body.dart';

class RackInfoView extends StatelessWidget {
  const RackInfoView({super.key, required this.hotelAsset});
  final String hotelAsset;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: RackInfoViewBody(hotelAsset: hotelAsset)),
    );
  }
}
