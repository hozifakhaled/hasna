import 'package:flutter/material.dart';
import 'package:hasna/core/themeing/colors.dart';
import 'package:hasna/features/prayerstimers/presentation/widgets/prayerstimers_view_body.dart';

class PrayerstimersView extends StatelessWidget {
  const PrayerstimersView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        body: PrayerstimersViewBody(),
        backgroundColor: AppColors.thirdcolor,
      ),
    );
  }
}
