import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasna/core/extention/extention.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';
import 'package:hasna/core/themeing/colors.dart';

class PrayerTimesContainer extends StatelessWidget {
  const PrayerTimesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> prayerTimes = [
      {"name": "الفجر", "time": "5:00"},
      {"name": "الشروق", "time": "6:15"},
      {"name": "الظهر", "time": "12:30"},
      {"name": "العصر", "time": "3:45"},
      {"name": "المغرب", "time": "6:20"},
      {"name": "العشاء", "time": "8:00"},
    ];

    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(20.r),
      shadowColor: Colors.black26,
      child: Container(
        width: context.width * 0.9,
        decoration: BoxDecoration(
          color: AppColors.maincolor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          children: [
            // العنوان العلوي
            Container(
              width: double.infinity,
              height: context.height * 0.07,
              decoration: BoxDecoration(
                color: AppColors.secondcolor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
              ),
            ),
            
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Column(
                children: prayerTimes.asMap().entries.map((entry) {
                  final index = entry.key;
                  final prayer = entry.value;
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(prayer["name"]!, style: TextStyles.text20),
                            Text(prayer["time"]!, style: TextStyles.text20),
                          ],
                        ),
                      ),
                      if (index < prayerTimes.length - 1)
                        Divider(color: Colors.white, thickness: 2),
                    ],
                  );
                }).toList(),
              ),
            ),
            
            SizedBox(height: 10.h), // تحسين التباعد السفلي
          ],
        ),
      ),
    );
  }
}
