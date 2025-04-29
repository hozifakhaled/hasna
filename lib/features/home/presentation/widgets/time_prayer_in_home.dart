import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';
import 'package:hasna/core/themeing/colors.dart';

class TimePrayerinHome extends StatefulWidget {
  final String timeFromApi;
  final String? prayerName;
  final bool is24HourFormat;

  const TimePrayerinHome({
    super.key,
    required this.timeFromApi,
    this.prayerName,
    this.is24HourFormat = true,
  });

  @override
  State<TimePrayerinHome> createState() => _TimePrayerinHomeState();
}

class _TimePrayerinHomeState extends State<TimePrayerinHome> {
  Timer? _timer;
  Duration _remaining = Duration();
  late DateTime _targetTime;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void didUpdateWidget(covariant TimePrayerinHome oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.timeFromApi != widget.timeFromApi) {
      _timer?.cancel();
      _startTimer();
    }
  }

  void _startTimer() {
    List<String> parts = widget.timeFromApi.split(":");

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.maincolor.withOpacity(.30),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            _remaining.isNegative
                ? "انتهى الوقت!"
                : "باقي على صلاة ${widget.prayerName} : ${_formatDuration(_remaining)}",
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
