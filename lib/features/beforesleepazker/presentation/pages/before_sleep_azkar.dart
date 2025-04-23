import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hasna/core/di/getit.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';
import 'package:hasna/core/themeing/colors.dart';
import 'package:hasna/features/beforesleepazker/presentation/cubit/beforesleepazkar_cubit.dart';
import 'package:hasna/features/beforesleepazker/presentation/widgets/before_sleep_azkar_body_view.dart';
class BeforeSleepAzkar extends StatelessWidget {
  const  BeforeSleepAzkar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<EveningazkerCubit>()..initIfNeedes(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
          ),
          backgroundColor: AppColors.maincolor,
          centerTitle: true,
          title: Text(
            'أذكار قبل النوم',
            style: TextStyles.text20.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: BeforeSleepAzkarBodyView(),
      ),
    );
  }
}
