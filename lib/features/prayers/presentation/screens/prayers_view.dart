import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasna/core/di/getit.dart';
import 'package:hasna/features/prayers/presentation/cubit/prayers_cubit.dart';
import 'package:hasna/features/prayers/presentation/widgets/prayers_view_body.dart';

class PrayersView extends StatelessWidget {
  const PrayersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PrayersCubit>()..initIfNeedes(),
      child: SafeArea(child: Scaffold(body: PrayersViewBody())),
    );
  }
}
