import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/Hotels/models/hotel_model.dart';
import 'widgets/rack_info_view_body.dart';

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
