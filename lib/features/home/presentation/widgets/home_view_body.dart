import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';
import 'package:hasna/core/themeing/colors.dart';
import 'package:hasna/features/home/presentation/widgets/gridview_azker_in_home.dart';
import 'package:hasna/features/home/presentation/widgets/main_featrues_in_home.dart';
import 'package:hasna/features/home/presentation/widgets/stack_date_in_home.dart';
import 'package:hasna/features/home/presentation/widgets/time_prayer_in_home.dart';
import 'package:hasna/features/prayerstimers/presentation/cubit/prayerstimers_cubit.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayerstimersCubit, PrayerstimersState>(
      builder: (context, state) {
        if (state is PrayerstimersSuccess) {
          return Column(
            children: [
              StackTimePrayerAnddateInHome(
                day: state.prayersTimers.hijri!.day ?? "",
                month: state.prayersTimers.hijri!.month ?? "",
                weekday: state.prayersTimers.hijri!.weekday ?? "",
                year: state.prayersTimers.hijri!.year ?? "",
              ),
              MainFeatruesInHome(),
              TimePrayerinHome(
                prayerName: state.prayersTimers.nextPrayer!.name,
                timeFromApi: state.prayersTimers.nextPrayer!.time.toString(),
              ),
              GridViewAzkarInHome(),
            ],
          );
        } else if (state is PrayerstimersLoading) {
          return Column(
            children: [
              StackTimePrayerAnddateInHome(
                day: state.prayersTimers.hijri!.day ?? "",
                month: state.prayersTimers.hijri!.month ?? "",
                weekday: state.prayersTimers.hijri!.weekday ?? "",
                year: state.prayersTimers.hijri!.year ?? "",
              ),
              MainFeatruesInHome(),
              TimePrayerinHome(
                prayerName: state.prayersTimers.nextPrayer!.name,
                timeFromApi: state.prayersTimers.nextPrayer!.time.toString(),
              ),
              GridViewAzkarInHome(),
            ],
          );
        } else if (state is PrayerstimersError) {
          return Center(
            child: Text(
              state.message,
              style: TextStyles.text16.copyWith(color: AppColors.maincolor),
            ),
          );
        } else {
          return const SizedBox.shrink(); // Return an empty widget if no state matches
        }
      },
    );
  }
}
