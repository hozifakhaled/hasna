import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';

class CustomeAppbar2 extends StatelessWidget {
  const CustomeAppbar2({super.key, required this.title});
   final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,style:  TextStyles.text20.copyWith(color: Colors.white,fontWeight: FontWeight.bold),),
        SizedBox(width: 10.w,),
        Icon(Icons.arrow_back,color: Colors.white,)
      ],
    );
  }
}