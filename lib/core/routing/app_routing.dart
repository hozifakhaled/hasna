import 'package:go_router/go_router.dart';
import 'package:hasna/core/routing/routes.dart';
import 'package:hasna/features/hadiths/presentation/screens/hadith_view.dart';
import 'package:hasna/features/home/presentation/screens/home_view.dart';
import 'package:hasna/features/onboarding/presentation/screens/onboarding_view.dart';
import 'package:hasna/features/publicazkar/presentation/screens/publiczekr_view.dart';
import 'package:hasna/features/prayerstimers/presentation/screens/prayerstimers_view.dart';
import 'package:hasna/features/splash/presentation/screens/splash_view.dart';
import 'package:hasna/features/tasbiha/presentation/screens/tasbiha_view.dart';
import 'package:hasna/features/zeker/presentation/pages/zaker_view.dart';

class AppRouting {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.splah, // التأكد أن initialLocation يطابق Route موجود
    routes: <GoRoute>[
   
      GoRoute(
        path: Routes.onboarding,
        builder: (context, state) => const OnboardingView(),
      ),
          GoRoute(
        path: Routes.hadith,
        builder: (context, state) => const HadithView(),
      ),

           GoRoute(
        path: Routes.prayTimers,
        builder: (context, state) => const PrayerstimersView(),
      ),
      GoRoute(
        path: Routes.home,
        builder: (context, state) => const HomeView(),
      ),
       GoRoute(
        path: Routes.zaker,
        builder: (context, state) => const ZakerView(),
      ),
      GoRoute(path: Routes.splah, builder: (context, state) => const SplashView()),
      GoRoute(path: Routes.publicazkar, builder: (context, state) => const PubliczekrView()),
      GoRoute(path: Routes.tasbiha, builder: (context, state) => const TasbihaView()),
    ],
  );
}
