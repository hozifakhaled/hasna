import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';
import 'package:hasna/core/widgets/custome_appbar2.dart';

class ColumnTextZaker extends StatelessWidget {
  const ColumnTextZaker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: CustomeAppbar2(title: 'أذكار المساء'),
        ),
        SizedBox(height: 30.h),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'أَعُوذُ بِكَلِمَاتِ اللهِ التَّامَّةِ مِنْ شَرِّ مَا خَلَقَ',
            style: TextStyles.text21.copyWith(color: Colors.white),
          ),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Divider(color: Colors.white, endIndent: 3, height: 3),
        ),
        SizedBox(height: 10.h),
    
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'ثلاث مرات',
            style: TextStyles.text15.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}


