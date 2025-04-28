import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hasna/constants/images.dart';
import 'package:hasna/core/extention/extention.dart';
import 'package:hasna/core/themeing/colors.dart';
class StackTimePrayerAnddateInHome extends StatelessWidget {
  const StackTimePrayerAnddateInHome({
    super.key, 
    required this.day, 
    required this.month, 
    required this.weekday, 
    required this.year
  });
  
  final String day; 
  final String month;
  final String weekday;
  final String year;

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
              width: 140.w,
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
                    "$weekday - $year",
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
