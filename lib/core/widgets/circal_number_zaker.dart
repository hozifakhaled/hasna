import 'package:flutter/material.dart';
import 'package:hasna/core/extention/extention.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';
import 'package:hasna/core/themeing/colors.dart';

class CircalNumberZaker extends StatelessWidget {
  const CircalNumberZaker({
    super.key, required this.number, required this.onTap,
  });
final int number ;
 final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: context.height * 0.03,
      right: context.width * 0.375,
      child: InkWell(
       
        onTap: onTap,
        child: Container(
          width: context.width * 0.25,
          height: context.width * 0.25,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.secondcolor, width: 4),
            color: AppColors.thirdcolor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text(
             number.toString() ,
              style: TextStyles.text30.copyWith(color: AppColors.secondcolor),
            ),
          ),
        ),
      ),
    );
  }
}
