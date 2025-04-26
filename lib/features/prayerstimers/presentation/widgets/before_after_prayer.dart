import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';
import 'package:hasna/core/themeing/colors.dart';

class BeforeAndAfterPrayer extends StatelessWidget {
  const BeforeAndAfterPrayer({
    super.key, required this.prayname, required this.praytime, required this.praytimeday,
  });
  final String prayname;
  final String praytime;
  final String praytimeday;
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
    children: [
      Text(
        praytimeday,
        style: TextStyles.text15.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w100,
        ),
      ),
      SizedBox(height: 10), // بديل spacing
      Text(
         prayname,
        style: TextStyles.text15.copyWith(
          color: AppColors.thirdcolor,
        ),
      ),
      SizedBox(height: 10),
      Text(
        praytime,
        style: TextStyles.text20.copyWith(),
      ),
    ],
  ),
),

    );
  }
}
