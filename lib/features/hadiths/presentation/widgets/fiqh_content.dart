import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';
import 'package:hasna/core/themeing/colors.dart';

class FiqhContent extends StatelessWidget {
  final String fiqh;

  const FiqhContent({super.key, required this.fiqh});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'الفقه',
          style: TextStyles.text15.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.secondcolor,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          fiqh,
          style: TextStyles.text15,
          softWrap: true,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
