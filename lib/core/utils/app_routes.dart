import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/data/models/hotel_model/hotel_model.dart';
import 'package:flutter_application_1/features/home/presentation/views/building_view.dart';
import 'package:flutter_application_1/features/home/presentation/views/rack_info_view.dart';
import 'package:flutter_application_1/features/home/presentation/views/racks_view.dart';
import 'package:flutter_application_1/features/splash/splash_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/views/login_view.dart';
import '../../features/home/presentation/views/dashboard_view.dart';

class AppRoutes {
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String building = '/building';
  static const String racks = '/racks';
  static const String rackInfo = '/rack-info';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashView()),
      GoRoute(path: login, builder: (context, state) => const LoginView()),
      GoRoute(
        path: dashboard,
        builder: (context, state) => const DashboardView(),
      ),
      GoRoute(
        path: '/building',
        builder: (context, state) {
          final hotel = state.extra;
          if (hotel is! HotelModel) {
            return const Scaffold(
              body: Center(child: Text('Invalid hotel data')),
            );
          }
          return BuildingView(hotelAsset: hotel.logo ?? '', hotelName: hotel);
        },
      ),

      GoRoute(
        path: racks,
        builder: (context, state) {
          final logo = state.extra;
          if (logo is! String) {
            return const Scaffold(body: Center(child: Text('Invalid logo')));
          }
          return RacksView(hotelAsset: logo);
        },
      ),
      GoRoute(
        path: rackInfo,
        builder: (context, state) {
          final logo = state.extra;
          if (logo is! String) {
            return const Scaffold(body: Center(child: Text('Invalid logo')));
          }
          return RackInfoView(hotelAsset: logo);
        },
      ),
    ],
  );
}
