
import 'package:go_router/go_router.dart';
import 'package:ingemath/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: "/operations",
      builder: (context, state) => const OperationsScreen(),
    ),
  ],
);