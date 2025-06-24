import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/Hotels/models/hotel_model.dart';
import 'package:flutter_application_1/features/home/Racks/cubit/rack_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/rack_view_body.dart';

class RacksView extends StatelessWidget {
  const RacksView({super.key, required this.hotelModel});
  final HotelModel hotelModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => RackCubit()..getRacksInfo(),
          child: RackViewBody(hotelModel: hotelModel),
        ),
      ),
    );
  }
}
