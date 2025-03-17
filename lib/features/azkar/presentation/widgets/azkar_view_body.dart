import 'package:flutter/material.dart';
import 'package:hasna/core/themeing/colors.dart';
import 'package:hasna/core/widgets/zekr_container.dart';

class AzkarViewBody extends StatelessWidget {
  const AzkarViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.thirdcolor,
      body:  GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
       itemBuilder: (context, index) => ZekrContainer(zekr: 'أذكار الصباح',),),
    );
  }
}