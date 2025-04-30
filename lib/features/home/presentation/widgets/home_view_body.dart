import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          final prayers = state.prayersTimers;

          return CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                delegate: _StackHeaderDelegate(
                  child: StackTimePrayerAnddateInHome(
                    day: prayers.hijri?.day ?? "",
                    month: prayers.hijri?.month ?? "",
                    weekday: prayers.hijri?.weekday ?? "",
                    year: prayers.hijri?.year ?? "",
                  ),
                ),
              ),
              SliverToBoxAdapter(child: const MainFeatruesInHome()),
              SliverToBoxAdapter(
                child: TimePrayerinHome(
                  prayerName: prayers.nextPrayer?.name ?? "",
                  timeFromApi: prayers.nextPrayer?.time.toString() ?? "",
                ),
              ),
              const SliverToBoxAdapter(child: GridViewAzkarInHome()),
            ],
          );
        }
        if (state is PrayerstimersError) {
          return Center(child: Text("لا يوجد انترنت"));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class _StackHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _StackHeaderDelegate({required this.child});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final bool isCollapsed =
        shrinkOffset > 50; // مقدار الـ scroll اللي نعتبره collapsed

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child:
          isCollapsed
              ? Container(
                key: const ValueKey('collapsed'),
                height: maxExtent,
                color: AppColors.maincolor,
                alignment: Alignment.center,
                child: Text('حَسْنَة', style: TextStyles.logo),
              )
              : Container(
                key: const ValueKey('expanded'),
                color: Colors.white,
                child: child,
              ),
    );
  }

  @override
  double get maxExtent => 150.h;

  @override
  double get minExtent => 60.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
