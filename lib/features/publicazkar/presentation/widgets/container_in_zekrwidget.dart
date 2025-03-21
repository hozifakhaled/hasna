import 'package:flutter/material.dart';
import 'package:hasna/core/themeing/colors.dart';

class ContainerInZekrWidget extends StatelessWidget {
  const ContainerInZekrWidget({
    super.key,
    required this.width,
    required this.height,
    required this.child, // إضافة باراميتر child
  });

  final double width;
  final double height;
  final Widget child; // تعريف child

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.secondcolor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(child: child), // استخدام child بدلاً من Icon ثابت
    );
  }
}
