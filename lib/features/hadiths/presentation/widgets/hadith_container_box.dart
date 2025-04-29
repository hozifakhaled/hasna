import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasna/constants/images.dart';
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
          constraints: BoxConstraints(minHeight: 150.h),
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
