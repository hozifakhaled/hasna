import 'package:go_router/go_router.dart';
import 'package:hasna/features/home/presentation/screens/home_view.dart';

class AppRouting {
  static final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeView(),
      ),
    ]
  );
}