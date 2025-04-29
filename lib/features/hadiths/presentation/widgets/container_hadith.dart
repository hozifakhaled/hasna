import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasna/core/themeing/colors.dart';
import 'package:hasna/features/hadiths/presentation/cubit/hadiths_cubit.dart';
import 'package:hasna/features/hadiths/presentation/widgets/button_in_hadith.dart';
import 'package:hasna/features/hadiths/presentation/widgets/hadith_container_box.dart';
import 'importance_and_fiqh.dart';

class ContainerHadith extends StatelessWidget {
  const ContainerHadith({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: BlocBuilder<HadithsCubit, HadithsState>(
        builder: (context, state) {
          if (state is HadithsLoaded) {
            final importance = state.hadith.importance.toString();
            final fiqh = state.hadith.fiqh.toString();
            final hadithText = state.hadith.hadith.toString();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.h),
                Material(
                  color: AppColors.thirdcolor,
                  elevation: 3,
                  borderRadius: BorderRadius.circular(20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: HadithContainerBox(hadithText: hadithText),
                  ),
                ),
                SizedBox(height: 30.h),
                ButtonInHadith(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) =>
                            ImportanceAndFiqh(importance: importance, fiqh: fiqh),
                        transitionsBuilder: (_, animation, __, child) {
                          final offset = Tween(begin: const Offset(0, 1), end: Offset.zero)
                              .chain(CurveTween(curve: Curves.easeInOut))
                              .animate(animation);
                          return SlideTransition(position: offset, child: child);
                        },
                      ),
                    );
                  },
                ),
              ],
            );
          } else if (state is HadithsError) {
            return Center(child: Text(state.errorMessage));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
