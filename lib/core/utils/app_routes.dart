import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/guest_flow/presentation/views/guest_building_view.dart';
import 'package:flutter_application_1/features/guest_flow/presentation/views/guest_rack_view.dart';
import 'package:flutter_application_1/features/home/Buildings/data/models/building_model.dart';
import 'package:flutter_application_1/features/home/Buildings/presentation/views/edit_building_view.dart';
import 'package:flutter_application_1/features/home/Hotels/data/models/hotel_model.dart';
import 'package:flutter_application_1/features/home/Buildings/presentation/cubit/building_cubit.dart';
import 'package:flutter_application_1/features/home/Hotels/presentation/cubit/hotel_cubit.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/cubit/rack_cubit.dart';
import 'package:flutter_application_1/features/home/Buildings/presentation/views/add_building_view.dart';
import 'package:flutter_application_1/features/home/Hotels/presentation/views/add_hotel_view.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/rack_info_model.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/views/add_rack_view.dart';
import 'package:flutter_application_1/features/home/Buildings/presentation/views/building_view.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/views/add_summary_view.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/views/add_switch_view.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/views/edit_rack_view.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/views/racks_view.dart';
import 'package:flutter_application_1/features/home/devices/presentation/views/add_device_view.dart';
import 'package:flutter_application_1/features/home/devices/presentation/views/device_details_view.dart';
import 'package:flutter_application_1/features/home/devices/presentation/views/device_view.dart';
import 'package:flutter_application_1/features/home/devices/presentation/views/edit_device_view.dart';
import 'package:flutter_application_1/features/splash/splash_view.dart';
import 'package:flutter_application_1/features/users/presentation/views/add_user_view.dart';
import 'package:flutter_application_1/features/users/presentation/views/users_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/views/login_view.dart';
import '../../features/home/Hotels/presentation/views/hotel_view.dart';

class AppRoutes {
  static const String login = '/login';
  static const String hotels = '/hotels';
  static const String building = '/building';
  static const String racks = '/racks';
  static const String addBuilding = '/add_building';
  static const String addRack = '/add_rack';
  static const String addHotel = '/add_hotel';
  static const String editBuilding = '/edit_building';
  static const String addUser = '/add_user';
  static const String users = '/users';
  static const String editRack = '/edit_rack';
  static const String addSwitch = '/add_switch';
  static const String addSummary = '/add_summary';
  static const String device = '/device';
  static const String addDevice = '/add_device';
  static const String editDevice = '/edit_device';
  static const String deviceDetails = '/device_details';
  static const String guestBuilding = '/guest_building';
  static const String guestRack = '/guest_rack';

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
        path: editBuilding,
        builder: (context, state) => EditBuildingView(),
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
      GoRoute(path: editRack, builder: (context, state) => EditRackView()),
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
      GoRoute(
        path: addUser,
        builder: (context, state) {
          return const AddUserView();
        },
      ),
      GoRoute(
        path: users,
        builder: (context, state) {
          return const UsersView();
        },
      ),
      GoRoute(path: addSwitch, builder: (context, state) => AddSwitchView()),
      GoRoute(path: addSummary, builder: (context, state) => AddSummaryView()),
      GoRoute(path: device, builder: (context, state) => DeviceView()),
      GoRoute(path: addDevice, builder: (context, state) => AddDeviceView()),
      GoRoute(path: editDevice, builder: (context, state) => EditDeviceView()),
      GoRoute(
        path: deviceDetails,
        builder: (context, state) => DeviceDetailsView(),
      ),
      GoRoute(
        path: guestBuilding,
        builder: (context, state) => GuestBuildingView(),
      ),
      GoRoute(path: guestRack, builder: (context, state) => GuestRackView()),
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
