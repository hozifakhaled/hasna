import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hasna/core/helper/helper.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';
import 'package:hasna/core/themeing/colors.dart';
import 'package:hasna/core/widgets/container_in_zekrwidget.dart';

class PubliczakerAppbar extends StatelessWidget {
  const PubliczakerAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.thirdcolor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
             Helper().showResetConfirmationDialog(context);
              },
              child: ContainerInZekrWidget(
                width: 50.0.w,
                height: 50.0.h,
                color: AppColors.secondcolor,
                child: Icon(Icons.sync, color: AppColors.light),
              ),
            ),
            Text(
              'لَا يَزَالُ لِسَانُكَ رَطْبًا بِذِكْرِ اللَّهِ',
              style: TextStyles.textwiget100.copyWith(
                color: AppColors.maincolor,
              ),
            ),
            GestureDetector(
              onTap: () {
                GoRouter.of(context).pop();
              },
              child: Icon(
                Icons.arrow_forward,
                color: AppColors.maincolor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}