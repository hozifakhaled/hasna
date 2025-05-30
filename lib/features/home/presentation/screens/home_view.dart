import 'package:flutter/material.dart';

import 'package:hasna/core/themeing/colors.dart';
import 'package:hasna/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
        body: HomeViewBody(),
        backgroundColor: AppColors.thirdcolor,
      ),
    );
  }
}
