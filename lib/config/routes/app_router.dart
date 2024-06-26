import 'package:go_router/go_router.dart';
import '../../presentation/screens/screens.dart';

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
        ),
        GoRoute(
          path: "interest_rate",
          builder: (context, state) => const InterestRateScreen(),
        ),
        GoRoute(
          path: "tir",
          builder: (context, state) => const TirScreen(),
        ),
        GoRoute(
          path: "gradient",
          builder: (context, state) => const GradientScreen(),
        ),
      ],
    ),
  ],
);
