import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';
import 'package:hasna/core/themeing/colors.dart';

class ZekrContainer extends StatelessWidget {
  const ZekrContainer({super.key, required this.zekr});
 final String zekr;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 107.w,
        height: 107.h,
        decoration: BoxDecoration(
          color: AppColors.maincolor,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
        ]),
        child: Center(child: Text(zekr,style: TextStyles.text20.copyWith(color: AppColors.thirdcolor),))
    ));
  }
}