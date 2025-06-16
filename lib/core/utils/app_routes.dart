import 'package:flutter_application_1/features/dashboard/presentation/views/building_view.dart';
import 'package:flutter_application_1/features/dashboard/presentation/views/racks_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/views/login_view.dart';
import '../../features/dashboard/presentation/views/dashboard_view.dart';

class AppRoutes {
  static const String dashboard = '/dashboard';
  static const String building = '/building';
  static const String racks = '/racks';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const LoginView()),
      GoRoute(
        path: dashboard,
        builder: (context, state) => const DashboardView(),
      ),
      GoRoute(
        path: building,
        builder: (context, state) => const BuildingView(),
      ),
      GoRoute(path: racks, builder: (context, state) => const RacksView()),
    ],
  );
}
