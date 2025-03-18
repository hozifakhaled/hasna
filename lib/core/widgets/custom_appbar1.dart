import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasna/constants/images.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';
import 'package:hasna/core/themeing/colors.dart';

class CustomAppbar1 extends StatelessWidget {
  const CustomAppbar1({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.h,
      
      decoration: BoxDecoration(
        color: AppColors.maincolor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15.r),
          bottomRight: Radius.circular(15.r),
        ),
      ),
      child: Row(
        mainAxisAlignment:  MainAxisAlignment.spaceAround,
        children: [
          Text(title,style:  TextStyles.text20.copyWith(color: Colors.white,fontWeight: FontWeight.bold),),
          Image.asset(Assets.imagesIconinappbar,width: 24.w,height: 24.h,)
        ],
      ),
    );
  }
}