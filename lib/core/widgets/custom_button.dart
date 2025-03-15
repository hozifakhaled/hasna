import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? bordercolor;
  final Color? textcolor;
  final Color? buttonbodycolor;
  final void Function()? onTap;
  const CustomButton({super.key, required this.text, this.onTap, this.bordercolor, this.textcolor, this.buttonbodycolor,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50.h,
        decoration: BoxDecoration(
          border: Border.all(color: bordercolor?? Colors.transparent),
          color: buttonbodycolor ,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyles.text18.copyWith(
              fontWeight: FontWeight.bold,
              color: textcolor ?? Colors.white,
            ),
          ),
        ),
      ),
      );
  }
}