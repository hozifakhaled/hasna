import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasna/constants/images.dart';
import 'package:hasna/core/widgets/custome_appbar2.dart';
import 'package:hasna/features/prayers/presentation/cubit/prayers_cubit.dart';
import 'package:hasna/features/prayers/presentation/widgets/list_item_prayer.dart';

class PrayersViewBody extends StatelessWidget {
  const PrayersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Stack(
        children: [
          /// صورة الخلفية ستظل ثابتة
          Positioned.fill(
            top: 200,

            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                Assets.imagesBearish1,
                width: 200.w,
                fit: BoxFit.contain,
              ),
            ),
          ),

          /// المحتوى القابل للتمرير
          Column(
            children: [
              CustomeAppbar2(title: 'أدعية من القرآن '),
              SizedBox(
                height: 10.h,
              ),
              BlocBuilder<PrayersCubit, PrayersState>(
                builder: (context, state) {
                   if (state is PrayersLoaded) {
                    return ListItemPrayer(prayersList: state.prayersList,);
                  } else if (state is PrayersError) {
                    return Center(
                      child: Text(state.errorMessage),
                    );
                  }
                else{
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  // Return an empty widget if none of the states match
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

