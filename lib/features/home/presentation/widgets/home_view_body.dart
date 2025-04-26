import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hasna/constants/images.dart';
import 'package:hasna/core/extention/extention.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';
import 'package:hasna/core/themeing/colors.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StackTimePrayerAnddateInHome(),
        MainFeatruesInHome(),
       Padding(
         padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
         child: Container(
            width: double.infinity,
           
            decoration: BoxDecoration(
              color: AppColors.maincolor.withOpacity(.30),
              borderRadius: BorderRadius.circular(10.r),
         
              ),
            
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                   "   الصلاه القادمه :الظهر الساعه  12:00",
                style: TextStyles.text16.copyWith(
                  color: AppColors.maincolor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
         ),
       ),
        GridViewAzkarInHome(),
      ],
    );
  }
}

class GridViewAzkarInHome extends StatelessWidget {
  const GridViewAzkarInHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 1.6,
          ),
          itemCount: 12,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                color: AppColors.thirdcolor,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: AppColors.maincolor, width: 2.w),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.sunny,color: AppColors.secondcolor,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "اذكار الصباح",
                        style: TextStyles.text20.copyWith(
                          color: AppColors.maincolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class MainFeatruesInHome extends StatelessWidget {
  const MainFeatruesInHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      decoration: BoxDecoration(
        color: AppColors.maincolor,
        
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "الصلاه ",
              style: TextStyles.text16.copyWith(color: AppColors.thirdcolor),
            ),
            Text(
              "القبله ",
              style: TextStyles.text16.copyWith(color: AppColors.thirdcolor),
            ),
            Text(
              "العداد ",
              style: TextStyles.text16.copyWith(color: AppColors.thirdcolor),
            ),
            Text(
              "الاذكار ",
              style: TextStyles.text16.copyWith(color: AppColors.thirdcolor),
            ),
            Text(
              "التقويم ",
              style: TextStyles.text16.copyWith(color: AppColors.thirdcolor),
            ),
          ],
        ),
      ),
    );
  }
}

class StackTimePrayerAnddateInHome extends StatelessWidget {
  const StackTimePrayerAnddateInHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 150.h,
     
    
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(Assets.imagesGrob, fit: BoxFit.fill),
          ),
          Positioned(
            child: Container(
              width: double.infinity,
              height: 170.h,
              decoration: BoxDecoration(
                color: AppColors.maincolor.withOpacity(0.6),
             
              ),
            ),
          ),

          Positioned(
            bottom: 10.h,
            left: context.width * 0.5 - 70.w,
            child: Container(
              width: 140.w,
             // height: 110.h,
              decoration: BoxDecoration(
                // shape: BoxShape.circle,
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20.r),
                // border: Border.all(color: AppColors.thirdcolor, width: 1.w),
              ),
              child: Column(
                spacing: 0,
                //    mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "27",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "شوال",
                    style: GoogleFonts.amiri(
                      color: Colors.white,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "السبت -  1446",
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
