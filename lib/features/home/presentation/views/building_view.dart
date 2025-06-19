import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/data/models/hotel_model/hotel_model.dart';

import 'widget/building_view_body.dart';

class BuildingView extends StatelessWidget {
  const BuildingView({
    super.key,
    required this.hotelAsset,
    required this.hotelName,
  });
  final String hotelAsset;
  final HotelModel hotelName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BuildingViewBody(
          hotelAsset: hotelAsset,
          hotelName: hotelName.name!,
        ),
      ),
    );
  }
}
