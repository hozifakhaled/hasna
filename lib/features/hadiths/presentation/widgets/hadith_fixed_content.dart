import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';

class HadithFixedContent extends StatelessWidget {
  final String hadithText;

  const HadithFixedContent({super.key, required this.hadithText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'نص الحديث :',
            style: TextStyles.text15.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            hadithText,
            style: TextStyles.text15.copyWith(height: 1.6),
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
          ),
        ],
      ),
    );
  }
}
