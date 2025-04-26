import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasna/constants/images.dart';
import 'package:hasna/core/widgets/custom_appbar1.dart';
import 'package:hasna/features/prayerstimers/presentation/cubit/prayerstimers_cubit.dart';
import 'package:hasna/features/prayerstimers/presentation/widgets/before_after_prayer.dart';
import 'package:hasna/features/prayerstimers/presentation/widgets/prayers_times.dart';

class PrayerstimersViewBody extends StatelessWidget {
  const PrayerstimersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAppbar1(
            title: 'أوقات الصلاة',
            image: Assets.imagesImageposla,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                // هنا حطينا BlocBuilder في الأول
                BlocBuilder<PrayerstimersCubit, PrayerstimersState>(
                  builder: (context, state) {
                    if (state is PrayerstimersLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is PrayerstimersError) {
                      return Center(child: Text('خطأ: ${state.message}'));
                    } else if (state is PrayerstimersSuccess) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BeforeAndAfterPrayer(
                                prayname: state.prayersTimers.previousPrayer!.name.toString(),
                                praytime: state.prayersTimers.previousPrayer!.time.toString(),
                                praytimeday: "الصلاة السابقة",
                              ),
                              const SizedBox(width: 10),
                              BeforeAndAfterPrayer(
                                prayname: state.prayersTimers.nextPrayer!.name.toString(),
                                praytime: state.prayersTimers.nextPrayer!.time.toString(),
                                praytimeday: "الصلاة القادمة",
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                          PrayerTimesContainer(
                            prayerTimes: state.prayersTimers,
                          ),
                        ],
                      );
                    }
                    return Container(); // Default empty container
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
