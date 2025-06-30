import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/Hotels/cubit/hotel_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/hotels_view_body.dart';

class HotelsView extends StatelessWidget {
  const HotelsView({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HotelCubit()..getHotels(),
        child: HotelsViewBody(),
      ),
    );
  }
}
