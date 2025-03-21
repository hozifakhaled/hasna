import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';
import 'package:hasna/core/themeing/colors.dart';

class BeforeAndAfterPrayer extends StatelessWidget {
  const BeforeAndAfterPrayer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondcolor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      height: 130.h,
      width: 130.h,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Text(
              'الصلاة القادمة',
              style: TextStyles.text15.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w100,
              ),
            ),
            Text(
              'الفجر',
              style: TextStyles.text15.copyWith(
                color: AppColors.thirdcolor,
                // fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '  8:16  ص',
              style: TextStyles.text20.copyWith(
                ///  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}
