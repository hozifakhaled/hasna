import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasna/constants/images.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 30,
            child: Image.asset(
              Assets.imagesSplashimage,
              width: 120.w,
              fit: BoxFit.contain,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("حَسَنَةٌ", style: TextStyles.text35),
                Text(
                  'HASNA',
                  style: TextStyles.text20.copyWith( fontWeight: FontWeight.w900,
  color: Colors.white,),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
