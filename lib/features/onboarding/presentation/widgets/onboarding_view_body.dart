import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hasna/constants/images.dart';
import 'package:hasna/core/extention/extention.dart';
import 'package:hasna/core/routing/routes.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';
import 'package:hasna/core/themeing/colors.dart';
import 'package:hasna/core/widgets/custom_button.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          // left: 0,
          child: Image.asset(
            fit: BoxFit.fill,
            width: context.width,
            Assets.imagesOnbooardingimage,
          ),
        ),
        Center(
          child: Column(
            spacing: 20.h,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('حَسَنَةٌ',style:  TextStyles.text35.copyWith(color: Colors.white,fontWeight: FontWeight.w900),),
              Text('اذكر الله يذكرك، واشكره يزدك',style:  TextStyles.text20.copyWith(color: Colors.white,fontWeight: FontWeight.bold),),
          SizedBox(
            width:context.width*0.6,
            child: CustomButton(text: 'ابدأ الان',buttonbodycolor: Colors.white,textcolor: AppColors.maincolor,onTap: (){
             
            },))
            child: CustomButton(text: 'ابدأ الان',buttonbodycolor: Colors.white,textcolor: AppColors.maincolor,onTap: (){},))
            ],
          ),
        ),
      ],
    );
  }
}
