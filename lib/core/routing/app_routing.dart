import 'package:go_router/go_router.dart';
import 'package:hasna/core/routing/routes.dart';
import 'package:hasna/features/azker/presentation/pages/azker_view.dart';
import 'package:hasna/features/hadiths/presentation/screens/hadith_view.dart';
import 'package:hasna/features/hadiths/presentation/widgets/fiqh_view_body.dart';
import 'package:hasna/features/hadiths/presentation/widgets/importance_and_fiqh.dart';
import 'package:hasna/features/home/presentation/screens/home_view.dart';
import 'package:hasna/features/onboarding/presentation/screens/onboarding_view.dart';
import 'package:hasna/features/prayers/presentation/screens/prayers_view.dart';
import 'package:hasna/features/prayerstimers/presentation/screens/prayerstimers_view.dart';
import 'package:hasna/features/publicazkar/data/models/tasabih_model.dart';
import 'package:hasna/features/publicazkar/presentation/screens/publiczaker_details_view.dart';
import 'package:hasna/features/publicazkar/presentation/screens/publiczekr_view.dart';
import 'package:hasna/features/quibla/presentation/screens/quibla_view.dart';

import 'package:hasna/features/tasbiha/presentation/screens/tasbiha_view.dart';

class AppRouting {
  static final GoRouter router = GoRouter(
  initialLocation:
     Routes.onboarding, // التأكد أن initialLocation يطابق Route موجود
    routes: <GoRoute>[
      GoRoute(
        path: Routes.tasbiha,
        builder: (context, state) =>  TasbihaView(),
      ),
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
        path: Routes.prayes,
        builder: (context, state) => const PrayersView(),
      ),
      GoRoute(path: Routes.home, builder: (context, state) => const HomeView()),
      GoRoute(
        path: Routes.publicazkar,
        builder: (context, state) => const PubliczekrView(),
      ),
      GoRoute(
        path: Routes.dpublicazkar,
        builder: (context, state) =>  PubliczakerDeatilsView(model: state.extra as TasabihModel,),
      ),
   
      GoRoute(
        path: Routes.azkar,
        
        builder: (context, state) =>  AzkerView(data: state.extra as Map<String,String>,),
      ),
      
      GoRoute(
        path: Routes.quibla,
        builder: (context, state) => const QuiblaView(),
      ),
   GoRoute(
  path: Routes.importancehadith,
  builder: (context, state) {
    

    
     final importance = state.extra as Map<String, dynamic>;

      return ImportanceAndFiqh(
        importance: importance['importance'] as String,
        fiqh: importance['fiqh'] as String,
      );
   
  },
),
GoRoute(path: Routes.fiqh, builder: (context, state) {
  final fiqh = state.extra as String;
        return  FiqhPage( fiqh: fiqh,);
      }),


    ],
  );
}
