import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasna/core/di/getit.dart';
import 'package:hasna/features/morningazker/presentation/cubit/morningazker_cubit.dart';
import 'package:hasna/features/morningazker/presentation/widgets/morning_azkar_view_body.dart';

// صفحة MorningAzkarView
class MorningAzkarView extends StatelessWidget {
  const MorningAzkarView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<MorningazkerCubit>()..initializeIfNeeded(),
      child: const MorningAzkarViewBody(),
    );
  }
}
