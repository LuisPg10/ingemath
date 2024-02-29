
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
      routes: [
        GoRoute(
          path: "annuities",
          builder: (context, state) => const AnnuitiesScreen(),
        ),
        GoRoute(
          path: "simple_interest",
          builder: (context, state) => const SimpleInterestScreen(),
        ),
        GoRoute(
          path: "compound_interest",
          builder: (context, state) => const CompoundInterestScreen(),
        )
      ]
    ),
  ],
);