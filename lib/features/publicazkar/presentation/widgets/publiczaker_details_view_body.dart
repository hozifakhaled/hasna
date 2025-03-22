import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';
import 'package:hasna/core/themeing/colors.dart';
import 'package:hasna/core/widgets/container_in_zekrwidget.dart';
import 'package:hasna/features/publicazkar/presentation/widgets/column_text_and_number_counter.dart';
import 'package:hasna/features/publicazkar/presentation/widgets/custom_circle_prograss.dart';

class PubliczakerDetailsViewBody extends StatelessWidget {
  const PubliczakerDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          Text(
            'اللهم صلِّ على محمدٍ وعلى آلِ محمدٍ، كما صلَّيتَ على إبراهيمَ وعلى آلِ إبراهيمَ، إنك حميدٌ مجيدٌ.وبارك على محمدٍ وعلى آلِ محمدٍ، كما باركتَ على إبراهيمَ وعلى آلِ إبراهيمَ، إنك حميدٌ مجيدٌ.',
            style: TextStyles.text21.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 35.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ColumnTextAndnumberCounter(text: ' دورة ', number: '5'),

              ColumnTextAndnumberCounter(text: 'العدد الكلي ', number: '55'),
            ],
          ),
          SizedBox(height: 35.h),
         CustomCircleProgress(value: 100,),
 //SizedBox(height: 35.h),
         Align(alignment: Alignment.bottomRight,child: ContainerInZekrWidget(width: 50.0.h, height: 50.0.h, color: AppColors.secondcolor,
         child: Icon(Icons.sync, color: AppColors.light,),)),
        ],
      ),
    );
  }
}

