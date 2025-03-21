import 'package:flutter/material.dart';
import 'package:hasna/constants/images.dart';
import 'package:hasna/core/widgets/custom_appbar1.dart';
import 'package:hasna/features/prayerstimers/presentation/widgets/before_after_prayer.dart';
import 'package:hasna/features/prayerstimers/presentation/widgets/prayers_times.dart';

class PrayerstimersViewBody extends StatelessWidget {
  const PrayerstimersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
    
      child: Column(
        children: [
          CustomAppbar1(title: 'أوقات الصلاة', image: Assets.imagesImageposla),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:List.generate(2, (index) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: BeforeAndAfterPrayer(),
            )),
          ),
      PrayerTimesContainer(),
          
        ],
      ),
    );
  }
}

