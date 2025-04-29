import 'package:flutter/material.dart';
import 'package:hasna/core/widgets/custom_appbar1.dart';
import 'package:hasna/features/hadiths/presentation/widgets/container_hadith.dart';

class HadithViewBody extends StatelessWidget {
  const HadithViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomAppbar1(title: 'حديث اليوم '),
          Center(child: const ContainerHadith()),
        ],
      ),
    );
  }
}
