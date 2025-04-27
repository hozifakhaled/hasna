import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hasna/core/routing/routes.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';
import 'package:hasna/core/themeing/colors.dart';

class MainFeatruesInHome extends StatelessWidget {
  const MainFeatruesInHome({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> items = [
       "الصلاه",
      "القبله",
      "العداد",
      "الاذكار",
      "التقويم",
    ];
    List<String> nav = [
        Routes.prayTimers,
      Routes.quibla,
      Routes.eveningazkar,
       Routes.morningazkar,
        Routes.prayes
    ];

    return Container(
      width: double.infinity,

      decoration: BoxDecoration(color: AppColors.maincolor),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) {
            return InkWell(
              onTap: () {
                // هنا ممكن تضيف أي أكشن تريده عند الضغط على العنصر
               GoRouter.of(context).push(nav[index]);
              },
              child: Text(
                " ${items[index]}",
                style: TextStyles.text16.copyWith(color: AppColors.thirdcolor),
              ),
            );
          }),
          
        ),
      ),
    );
  }
}
