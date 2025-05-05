import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasna/constants/images.dart';
import 'package:hasna/core/themeing/colors.dart';
import 'package:hasna/features/hadiths/presentation/widgets/hadith_fixed_content.dart';
import 'package:hasna/features/hadiths/presentation/widgets/hadith_scrollable_content.dart';

class HadithContainerBox extends StatelessWidget {
  final String hadithText;
  
  const HadithContainerBox({super.key, required this.hadithText});
  
  @override
  Widget build(BuildContext context) {
    final isLongText = hadithText.length > 200;
    
    return Stack(
      children: [
        Container(
          width: double.infinity,
          // For long text, use a fixed height that's tall enough for scrolling
          // For short text, use min height constraint
          constraints: isLongText 
              ? BoxConstraints(minHeight: 300.h) 
              : BoxConstraints(minHeight: 150.h),
          decoration: BoxDecoration(
            color: AppColors.thirdcolor,
            borderRadius: BorderRadius.circular(8.r),
            // Optional: add a slight shadow for better UI
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: isLongText
              ? HadithScrollableContent(hadithText: hadithText)
              : HadithFixedContent(hadithText: hadithText),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Image.asset(Assets.imagesCornertopleft, width: 40.w),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Image.asset(Assets.imagesCornerleftbottom, width: 55.w),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Image.asset(Assets.imagesCornertopright, width: 50.w),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset(Assets.imagesCornerbottomright, width: 40.w),
        ),
      ],
    );
  }
}