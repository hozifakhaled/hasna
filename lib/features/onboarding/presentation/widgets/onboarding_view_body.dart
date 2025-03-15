import 'package:flutter/material.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Text('حَسَنَةٌ',style:  TextStyles.text35.copyWith(color: Colors.white,fontWeight: FontWeight.w900),),
            Text('حَسَنَةٌ',style:  TextStyles.text20.copyWith(color: Colors.white,fontWeight: FontWeight.bold),),
          MaterialButton(
            onPressed: (){},
            color: Colors.white,
            textColor: Colors.black,
            child:Text(' ابدأ الان'),
          ),
          ],
        ),

      ],
    );
  }
}