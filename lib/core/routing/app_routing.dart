import 'package:go_router/go_router.dart';
import 'package:hasna/core/routing/routes.dart';
import 'package:hasna/features/onboarding/presentation/screens/onboarding_view.dart';

class AppRouting {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.splah,
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (context, state) => const OnboardingView(),
      ),
    ]
  );
}