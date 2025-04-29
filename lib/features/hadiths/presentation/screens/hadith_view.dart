import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasna/core/di/getit.dart';
import 'package:hasna/core/themeing/colors.dart';
import 'package:hasna/features/hadiths/presentation/cubit/hadiths_cubit.dart';
import 'package:hasna/features/hadiths/presentation/widgets/hadith_view_body.dart';

class HadithView extends StatelessWidget {
  const HadithView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.thirdcolor,
        body: BlocProvider(
          create: (context) => sl<HadithsCubit>()..getHadith(),
          child: HadithViewBody(),
        ),
      ),
    );
  }
}
