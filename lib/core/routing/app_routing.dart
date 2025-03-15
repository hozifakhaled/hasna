import 'package:go_router/go_router.dart';
import 'package:hasna/core/routing/routes.dart';
import 'package:hasna/features/home/presentation/screens/home_view.dart';

class AppRouting {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.splah, // التأكد أن initialLocation يطابق Route موجود
    routes: <GoRoute>[
      GoRoute(
        path: Routes.splah,
        builder: (context, state) => const SplashView(), // صفحة الـ Splash
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const OnboardingView(),
      ),
    ],
  );
}
