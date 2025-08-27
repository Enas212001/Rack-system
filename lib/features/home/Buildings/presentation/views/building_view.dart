import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/Buildings/presentation/cubit/building_cubit.dart';
import 'package:flutter_application_1/features/home/Hotels/data/models/hotel_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/building_view_body.dart';

class BuildingView extends StatelessWidget {
  const BuildingView({super.key, required this.hotelModel});
  final HotelModel hotelModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            BuildingCubit()..getBuildings(hotelId: hotelModel.id!),
        child: BuildingViewBody(hotelModel: hotelModel),
      ),
    );
  }
}
