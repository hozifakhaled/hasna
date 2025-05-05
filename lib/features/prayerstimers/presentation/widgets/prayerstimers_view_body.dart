import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:hasna/constants/images.dart';
import 'package:hasna/core/widgets/custom_appbar1.dart';
import 'package:hasna/features/prayerstimers/presentation/widgets/before_after_prayer.dart';
import 'package:hasna/features/prayerstimers/presentation/widgets/prayers_times.dart';

class PrayerstimersViewBody extends StatefulWidget {
  const PrayerstimersViewBody({super.key});

  @override
  State<PrayerstimersViewBody> createState() => _PrayerstimersViewBodyState();
}

class _PrayerstimersViewBodyState extends State<PrayerstimersViewBody> {
   
  final myCoordinates = Coordinates(30.5595, 31.0080); // Replace with your own location lat, lng.
  final params = CalculationMethod.egyptian.getParameters();

  late final PrayerTimes prayerTimes;

  @override
  void initState() {
    super.initState();
    prayerTimes = PrayerTimes.today(myCoordinates, params);
     params.madhab = Madhab.shafi;
  }

 

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
                
                   Column(
                        children: [
                          BeforeAndAfterPrayer(
                            prayname: prayerTimes.nextPrayer().name,
                            praytime: prayerTimes.timeForPrayer(prayerTimes.nextPrayer()).toString(),
                            praytimeday: "الصلاة القادمة",
                          ),
                          const SizedBox(height: 40),
                          PrayerTimesContainer(
                            prayerTimes:prayerTimes ,
                          ),
                        ],
                      )
                    
              ],
            ),
          ),
        ],
      ),
    );
  }
}
