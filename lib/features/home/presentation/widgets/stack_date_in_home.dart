import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hasna/constants/images.dart';
import 'package:hasna/core/extention/extention.dart';
import 'package:hasna/core/themeing/colors.dart';

import 'package:hijri/hijri_calendar.dart';

class StackTimePrayerAnddateInHome extends StatefulWidget {
  const StackTimePrayerAnddateInHome({
    super.key, 

  });
  
 

  @override
  State<StackTimePrayerAnddateInHome> createState() => _StackTimePrayerAnddateInHomeState();
}

class _StackTimePrayerAnddateInHomeState extends State<StackTimePrayerAnddateInHome> {
  var selectedDate =  HijriCalendar.now();
  late String day;
  late String month ;
  late String weekday ;
  late String year ;
  @override
  void initState() {
    super.initState();
    day = selectedDate.hDay.toString();
    month = selectedDate.longMonthName.toString();
    weekday = selectedDate.dayWeName.toString();
    year = selectedDate.hYear.toString();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 150.h,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              Assets.imagesGrob, 
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            child: Container(
              width: double.infinity,
              height: 170.h,
              
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: AppColors.maincolor.withOpacity(0.6),
              ),
            ),
          ),
          Positioned(
            bottom: 10.h,
            left: context.width * 0.5 - 70.w,
            child: Container(
              width: 160.w,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                spacing: 0,
                children: [
                  Text(
                  day,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    month,
                    style: GoogleFonts.amiri(
                      color: Colors.white,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "$weekday - $year  ",
                    style: GoogleFonts.amiri(
                      color: Colors.white,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
