import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/Hotels/cubit/hotel_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/dashboard_view_body.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => HotelCubit()..getHotels(),
          child: DashboardViewBody(),
        ),
      ),
    );
  }
}
