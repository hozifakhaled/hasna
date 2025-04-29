import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hasna/core/di/getit.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';
import 'package:hasna/core/themeing/colors.dart';
import 'package:hasna/features/prayers/presentation/cubit/prayers_cubit.dart';
import 'package:hasna/features/prayers/presentation/widgets/prayers_view_body.dart';

class PrayersView extends StatelessWidget {
  const PrayersView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => sl<PrayersCubit>()..initIfNeedes(),
        child: Scaffold(appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('أدعية من القرآن ',
              style:TextStyles.text18.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          automaticallyImplyLeading: true,
          leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
          ),
          backgroundColor: AppColors.maincolor,
          centerTitle: true,),body: PrayersViewBody()),
      ),
    );
  }
}
