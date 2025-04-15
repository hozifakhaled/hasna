import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasna/core/extention/extention.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';
import 'package:hasna/core/themeing/colors.dart';

class ZakerBottomBar extends StatelessWidget {
  const ZakerBottomBar({super.key, required this.totalAzker, required this.currentAzker});
 final int totalAzker ;
 final int currentAzker ;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height * 0.1,
      decoration: const BoxDecoration(
        color: AppColors.thirdcolor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_left,
                    color: AppColors.maincolor,
                    size: 55,
                  ),
                ),
                SizedBox(width: 10.w),

                Text(
                  'x1',
                  style: TextStyles.text20.copyWith(color: AppColors.maincolor),
                ),
              ],
            ),

            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.star_border,
                    color: AppColors.maincolor,
                    size: 30,
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  '$totalAzker/$currentAzker',
                  style: TextStyles.text20.copyWith(color: AppColors.maincolor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
