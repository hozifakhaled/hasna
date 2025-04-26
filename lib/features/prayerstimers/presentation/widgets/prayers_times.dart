import 'package:flutter/material.dart';
import 'package:hasna/core/themeing/colors.dart';
import 'package:hasna/features/prayerstimers/domain/entities/prayers_timers_entity.dart';

class PrayerTimesContainer extends StatelessWidget {
  final PrayersTimersEntity prayerTimes;

  const PrayerTimesContainer({super.key, required this.prayerTimes});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(20),
      shadowColor: Colors.black26,
      child: Container(
        width: double.infinity,
        // زودنا هنا padding داخلي و minHeight لو حبيت تتحكم في الحجم
        padding: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: AppColors.maincolor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // العنوان العلوي
            Container(
              width: double.infinity,
              height: 50,
              decoration: const BoxDecoration(
                color: AppColors.secondcolor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: const Center(
                child: Text(
                  'أوقات الصلاة',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),

            // عرض الأوقات مع dividers
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  _buildPrayerRow('الفجر', prayerTimes.fajr!),
                  _buildDivider(),
                  _buildPrayerRow('الظهر', prayerTimes.dhuhr!),
                  _buildDivider(),
                  _buildPrayerRow('العصر', prayerTimes.asr!),
                  _buildDivider(),
                  _buildPrayerRow('المغرب', prayerTimes.maghrib!),
                  _buildDivider(),
                  _buildPrayerRow('العشاء', prayerTimes.isha!),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrayerRow(String prayerName, String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(prayerName, style: const TextStyle(fontSize: 18, color: Colors.white)),
          Text(time, style: const TextStyle(fontSize: 18, color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Divider(color: Colors.white, thickness: 1.2),
    );
  }
}
