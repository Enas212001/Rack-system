import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/data/models/hotel_model/hotel_model.dart';
import 'widget/rack_view_body.dart';

class RacksView extends StatelessWidget {
  const RacksView({super.key, required this.hotelModel});
  final HotelModel hotelModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: RackViewBody(hotelModel: hotelModel)),
    );
  }
}
