import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';
import 'package:hasna/core/themeing/colors.dart';

class ButtonInHadith extends StatelessWidget {

  final Gradient? gradient;
  final void Function()? onTap;
  const ButtonInHadith({
    super.key,
     this.gradient, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.h,
        width: 300.w,
        decoration: BoxDecoration(
          gradient: gradient ??
              const LinearGradient(
                colors: [
                  AppColors.maincolor,
                  AppColors.secondcolor,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            'الأهميه و التفسير',
            style: TextStyles.text15.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
