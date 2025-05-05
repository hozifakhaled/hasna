import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:hasna/core/themeing/colors.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class PrayerTimesContainer extends StatefulWidget {
  final PrayerTimes prayerTimes;

  const PrayerTimesContainer({super.key, required this.prayerTimes});

  @override
  State<PrayerTimesContainer> createState() => _PrayerTimesContainerState();
}

class _PrayerTimesContainerState extends State<PrayerTimesContainer> {
  late Map<String, String> formattedPrayerTimes;

  @override
  void initState() {
    super.initState();

    final formatter = DateFormat('hh:mm ');

    formattedPrayerTimes = {
      'الفجر': formatter.format(
        widget.prayerTimes.fajr.add(Duration(hours: 1)),
      ),
      'الظهر': formatter.format(
        widget.prayerTimes.dhuhr.add(Duration(hours: 1)),
      ),
      'العصر': formatter.format(widget.prayerTimes.asr.add(Duration(hours: 1))),
      'المغرب': formatter.format(
        widget.prayerTimes.maghrib.add(Duration(hours: 1)),
      ),
      'العشاء': formatter.format(
        widget.prayerTimes.isha.add(Duration(hours: 1)),
      ),
    };
  }

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
                children: List.generate(formattedPrayerTimes.length, (index) {
                  return Column(
                    children: [
                      _buildPrayerRow(
                        formattedPrayerTimes.keys.toList()[index],
                        formattedPrayerTimes.values.toList()[index],
                      ),
                      if (index < formattedPrayerTimes.length - 1)
                        _buildDivider(),
                    ],
                  );
                }),
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
          Text(
            prayerName,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
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
