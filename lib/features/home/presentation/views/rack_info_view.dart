import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/data/models/hotel_model/hotel_model.dart';
import 'widget/rack_info_view_body.dart';

class RackInfoView extends StatelessWidget {
  const RackInfoView({
    super.key, required this.hotelModel,
  });
  final HotelModel hotelModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RackInfoViewBody(
          hotelModel: hotelModel,
        ),
      ),
    );
  }
}
