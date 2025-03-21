import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';
import 'package:hasna/core/themeing/colors.dart';
import 'package:hasna/core/widgets/container_in_zekrwidget.dart';
import 'package:hasna/features/publicazkar/presentation/widgets/zekr_wiget.dart';

class PubliczekrViewBody extends StatelessWidget {
  const PubliczekrViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
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
                    ContainerInZekrWidget(width: 50.0.w,height: 50.0.h, color: AppColors.secondcolor,
                    child: Icon(Icons.sync, color: AppColors.light,),),
                    Text(
                      'لَا يَزَالُ لِسَانُكَ رَطْبًا بِذِكْرِ اللَّهِ',
                      style: TextStyles.textwiget100.copyWith(color: AppColors.maincolor),
                    ),
                    Icon(Icons.arrow_forward, color: AppColors.maincolor),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  // القائمة المتحركة
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: 10,
                    itemBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: ZekrWiget(),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          ContainerInZekrWidget(width: 50.0.w,height: 50.0.h, color: AppColors.secondcolor,
                          child: Icon(Icons.add, color: AppColors.light,),),
                        ContainerInZekrWidget(width: 120.0.w, height: 50.0.h, color: AppColors.secondcolor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('المجموع',style: TextStyles.textwiget100.copyWith(color: AppColors.light),),
                            SizedBox(width: 10.w,),
                            Text('10',style: TextStyles.textwiget100.copyWith(color: AppColors.light),)
                          ],
                        ),), 
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
