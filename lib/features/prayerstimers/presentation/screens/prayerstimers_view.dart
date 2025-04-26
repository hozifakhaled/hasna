import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasna/core/di/getit.dart';
import 'package:hasna/core/themeing/colors.dart';
import 'package:hasna/features/prayerstimers/presentation/cubit/prayerstimers_cubit.dart';
import 'package:hasna/features/prayerstimers/presentation/widgets/prayerstimers_view_body.dart';

class PrayerstimersView extends StatelessWidget {
  const PrayerstimersView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        body: BlocProvider(
          create: (context) => sl<PrayerstimersCubit>()..getPrayersTimers(),
          child: PrayerstimersViewBody(),
        ),
        backgroundColor: AppColors.thirdcolor,
      ),
    );
  }
}
