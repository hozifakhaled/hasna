import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasna/core/themeing/colors.dart';
import 'package:hasna/core/widgets/custom_button.dart';
import 'package:hasna/core/widgets/custom_textformfiled.dart';

class BottomSheetAddZaker extends StatelessWidget {
  const BottomSheetAddZaker({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextFormFiled(text: 'أدخل الذكر'),
            SizedBox(height: 20),
            CustomTextFormFiled(text: 'أدخل عدد السبحه'),
            SizedBox(height: 20),
            CustomButton(text: 'إضافة الذكر', buttonbodycolor: AppColors.secondcolor, textcolor: Colors.white, onTap: () {}),
          ],
        ),
      ),
    );
  }
}

