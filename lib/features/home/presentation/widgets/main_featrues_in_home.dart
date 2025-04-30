import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hasna/core/routing/routes.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';
import 'package:hasna/core/themeing/colors.dart';

class MainFeatruesInHome extends StatelessWidget {
  const MainFeatruesInHome({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> items = ["الصلاه", "القبله", "الحديث", "التسابيح", "التقويم"];
    void handleNavigation(int index) {
      switch (index) {
        case 0:
          GoRouter.of(context).push(Routes.prayTimers);
          break;
        case 1:
          GoRouter.of(context).push(Routes.quibla);
          break;
        case 2:
          GoRouter.of(context).push(
            Routes.hadith,
          
          ); 
          break;
        case 3:
          GoRouter.of(context).push(
            Routes.publicazkar,
          
          );
          break;
        case 4:
          GoRouter.of(context).push(Routes.tasbiha);
          break;
        default:
          GoRouter.of(context).push(Routes.prayTimers);
          break;
      }
    }

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
                handleNavigation(index);
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
