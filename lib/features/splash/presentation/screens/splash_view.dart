import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hasna/core/routing/routes.dart';
import 'package:hasna/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:hasna/features/splash/presentation/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..loadApp(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashLoaded) {
           GoRouter.of(context).push(Routes.home);
          }
        },
        child: SplashViewBody(),
      ),
    );
  }
}
