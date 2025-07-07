import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/Buildings/data/models/building_model.dart';
import 'package:flutter_application_1/features/home/Hotels/data/models/hotel_model.dart';
import 'package:flutter_application_1/features/home/Buildings/presentation/cubit/building_cubit.dart';
import 'package:flutter_application_1/features/home/Hotels/presentation/cubit/hotel_cubit.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/cubit/rack_cubit.dart';
import 'package:flutter_application_1/features/home/Buildings/presentation/views/add_building_view.dart';
import 'package:flutter_application_1/features/home/Hotels/presentation/views/add_hotel_view.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/rack_info_model.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/views/add_rack_view.dart';
import 'package:flutter_application_1/features/home/Buildings/presentation/views/building_view.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/views/rack_info_view.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/views/racks_view.dart';
import 'package:flutter_application_1/features/splash/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/views/login_view.dart';
import '../../features/home/Hotels/presentation/views/hotel_view.dart';

class AppRoutes {
  static const String login = '/login';
  static const String hotels = '/hotels';
  static const String building = '/building';
  static const String racks = '/racks';
  static const String rackInfo = '/rack-info';
  static const String addBuilding = '/add_building';
  static const String addRack = '/add_rack';
  static const String addHotel = '/add_hotel';
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static final router = GoRouter(
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashView()),
      GoRoute(path: login, builder: (context, state) => const LoginView()),
      GoRoute(path: hotels, builder: (context, state) => const HotelsView()),
      GoRoute(
        path: building,
        builder: (context, state) {
          final hotel = state.extra;
          if (hotel is! HotelModel) {
            return const Scaffold(
              body: Center(child: Text('Invalid hotel data')),
            );
          }
          return BuildingView(hotelModel: hotel);
        },
      ),
      GoRoute(
        path: racks,
        builder: (context, state) {
          final args = state.extra;
          if (args is! GetRackArg) {
            return const Scaffold(body: Center(child: Text('Invalid rack')));
          }
          return RacksView(
            hotelModel: args.hotel,
            buildingModel: args.buildingModel,
          );
        },
      ),
      GoRoute(
        path: rackInfo,
        builder: (context, state) {
          final args = state.extra;
          if (args is! GetRackArg) {
            return const Scaffold(body: Center(child: Text('Invalid logo')));
          }
          return RackInfoView(
            hotelModel: args.hotel,
            buildingModel: args.buildingModel,
            rackInfoModel: args.rackInfoModel,
          );
        },
      ),
      GoRoute(
        path: addBuilding,
        builder: (context, state) {
          final args = state.extra;
          if (args is! AddBuildingArgs) {
            return const Scaffold(body: Center(child: Text('Invalid data')));
          }
          return BlocProvider.value(
            value: args.buildingCubit,
            child: AddBuildingView(hotelId: args.hotel.id!),
          );
        },
      ),
      GoRoute(
        path: addRack,
        builder: (context, state) {
          final args = state.extra;
          if (args is! AddRackArgs) {
            return const Scaffold(body: Center(child: Text('Invalid data')));
          }
          return BlocProvider.value(
            value: args.rackCubit,
            child: AddRackView(buildingRId: args.buildingModel.buildingRId!),
          );
        },
      ),
      GoRoute(
        path: addHotel,
        builder: (context, state) {
          final hotelCubit = state.extra as HotelCubit;
          return BlocProvider.value(
            value: hotelCubit,
            child: const AddHotelView(),
          );
        },
      ),
    ],
  );
}

class AddBuildingArgs {
  final HotelModel hotel;
  final BuildingCubit buildingCubit;

  AddBuildingArgs({required this.hotel, required this.buildingCubit});
}

class GetRackArg {
  final HotelModel hotel;
  final BuildingModel buildingModel;
  final RackInfoModel rackInfoModel;
  GetRackArg({
    this.rackInfoModel = const RackInfoModel(),
    required this.hotel,
    required this.buildingModel,
  });
}

class AddRackArgs {
  final RackCubit rackCubit;
  final BuildingModel buildingModel;
  AddRackArgs({required this.rackCubit, required this.buildingModel});
}
