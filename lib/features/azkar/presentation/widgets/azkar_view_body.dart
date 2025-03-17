import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasna/core/themeing/colors.dart';
import 'package:hasna/core/widgets/custom_appbar1.dart';
import 'package:hasna/core/widgets/zekr_container.dart';

class AzkarViewBody extends StatelessWidget {
  const AzkarViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.thirdcolor,
        body: Column(
          children: [
            const CustomAppbar1(title: 'الأذكار'),
             SizedBox(height: 30.h),
            Expanded( // الحل هنا
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                 mainAxisExtent: 150,
                  ),
                  itemCount: 10, // يجب تحديد عدد العناصر
                  itemBuilder: (context, index) => const ZekrContainer(zekr: 'أذكار الصباح'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
