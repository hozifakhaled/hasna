import 'package:go_router/go_router.dart';
import 'package:hasna/core/routing/routes.dart';
import 'package:hasna/features/home/presentation/screens/home_view.dart';

class AppRouting {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.splah,
    routes: <GoRoute>[
      GoRoute(
        path: Routes.home,
        builder: (context, state) => const HomeView(),
      ),
    ]
  );
}