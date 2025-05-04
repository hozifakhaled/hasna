import 'dart:async';
import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';
import 'package:hasna/core/themeing/colors.dart';
import 'package:intl/intl.dart';

class TimePrayerinHome extends StatefulWidget {
  
  final bool is24HourFormat;

  const TimePrayerinHome({
    super.key,
  
    this.is24HourFormat = true,
  });

  @override
  State<TimePrayerinHome> createState() => _TimePrayerinHomeState();
}

class _TimePrayerinHomeState extends State<TimePrayerinHome> {
  final myCoordinates = Coordinates(
    30.5595,
    31.0080,
  ); // Replace with your own location lat, lng.
  final params = CalculationMethod.egyptian.getParameters();

  late final PrayerTimes prayerTimes;

  Timer? _timer;
  Duration _remaining = Duration();
  late DateTime _targetTime;
late DateTime date;

// زود ساعة
late DateTime updated;

  // تنسيق بالعربي (مثلاً: ٠٤:٣١ م)
  late String formatted;

  @override
  void initState() {
    prayerTimes = PrayerTimes.today(myCoordinates, params);
    params.madhab = Madhab.shafi;
    date = DateTime.parse(prayerTimes.timeForPrayer(prayerTimes.nextPrayer()).toString());
    updated = date.add(Duration(hours: 1));
   final formatter = DateFormat('HH:mm');
    formatted = formatter.format(updated);
    super.initState();
    _startTimer();
  }

  @override
  void didUpdateWidget(covariant TimePrayerinHome oldWidget) {
    super.didUpdateWidget(oldWidget);

  }

  void _startTimer() {
    List<String> parts =formatted.split(":");

    int hours = int.parse(parts[0]);
    int minutes = int.parse(parts[1]);

    final now = DateTime.now();
    _targetTime = DateTime(now.year, now.month, now.day, hours, minutes);

    if (_targetTime.isBefore(now)) {
      _targetTime = _targetTime.add(Duration(days: 1));
    }

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      final now = DateTime.now();
      setState(() {
        _remaining = _targetTime.difference(now);
      });

      if (_remaining.isNegative) {
        _timer?.cancel();
      }
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$hours:$minutes:$seconds";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String getPrayerName(String prayerName) {
    if (prayerName == ' fajr ') {
      return 'الفجر';
    } else if (prayerName == 'sunrise') {
      return 'الشروق';
    } else if (prayerName == 'dhuhr') {
      return 'الظهر';
    } else if (prayerName == 'asr') {
      return 'العصر';
    } else if (prayerName == 'maghrib') {
      return 'المغرب';
    } else if (prayerName == 'isha') {
      return 'العشاء';
    } else {
      return 'غير معروف';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          // ignore: deprecated_member_use
          color: AppColors.maincolor.withOpacity(.30),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            _remaining.isNegative
                ? "انتهى الوقت!"
                : "باقي على صلاة ${getPrayerName(prayerTimes.nextPrayer().name)} : ${_formatDuration(_remaining)}",
            style: TextStyles.text16.copyWith(
              color: AppColors.maincolor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
