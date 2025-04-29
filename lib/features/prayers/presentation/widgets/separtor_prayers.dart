import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';
import 'package:hasna/core/themeing/colors.dart';

class Separatorprayers extends StatelessWidget {
  const Separatorprayers({
    super.key, required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Container رمادي على اليمين
        Container(
          width: 20.w,
          height: 20.h,
          decoration: BoxDecoration(
            color: AppColors.thirdcolor,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
     Text(
                 text ,
                        style: TextStyles.text15.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),),
        Container(
          width: 20.w,
          height: 20.h,
          decoration: BoxDecoration(
            color: AppColors.thirdcolor,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ],
    );
  }
}
