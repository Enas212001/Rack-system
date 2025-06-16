import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/views/login_view.dart';
import '../../features/dashboard/presentation/views/dashboard_view.dart';

class AppRoutes {
  static const String dashboard = '/dashboard';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const LoginView()),
      GoRoute(path: dashboard, builder: (context, state) => const DashboardView()),
    ],
  );
}
