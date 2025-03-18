import 'package:flutter/material.dart';
import 'package:hasna/core/themeing/colors.dart';
//import 'package:hasna/core/widgets/custom_appbar1.dart';
import 'package:hasna/features/hadiths/presentation/widgets/hadith_view_body.dart';
class HadithView extends StatelessWidget {
  const HadithView({super.key});

  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
      backgroundColor: AppColors.light,
      body: HadithViewBody(),
      ),
    );
  }
}