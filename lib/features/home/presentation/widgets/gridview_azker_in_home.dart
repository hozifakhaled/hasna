import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hasna/core/databases/api/endpoints.dart';
import 'package:hasna/core/routing/routes.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';
import 'package:hasna/core/themeing/colors.dart';

class GridViewAzkarInHome extends StatefulWidget {
  const GridViewAzkarInHome({super.key});

  @override
  State<GridViewAzkarInHome> createState() => _GridViewAzkarInHomeState();
}

class _GridViewAzkarInHomeState extends State<GridViewAzkarInHome> {
 
  final List<Map<String, dynamic>> azkarItems = [
  {
    "title": "اذكار الصباح",
    "icon": Icons.wb_sunny, // أيقونة الشمس
  },
  {
    "title": "اذكار المساء",
    "icon": Icons.nights_stay, // أيقونة الليل
  },
  {
    "title": "اذكار النوم",
    "icon": Icons.bedtime, // أيقونة السرير والنوم
  },
  {
    "title": "اذكار الخلاء",
    "icon": Icons.bathtub, // أيقونة الحمام أو الاستحمام
  },
  {
    "title": "اذكار الصلاة",
    "icon": Icons.mosque, // أيقونة المسجد (موجودة من Flutter 3.7 وأعلى)
  },
  {
    "title": "اذكار بعد الصلاة",
    "icon": Icons.done_all, // علامة انتهاء، تدل على بعد الصلاة
  },
  {
    "title": "أدعيه من القرآن",
    "icon": Icons.menu_book, // كتاب مفتوح، دلالة على القرآن
  },
];
 void handleNavigation(int index) {
    switch (index) {
      case 0:
      GoRouter.of(context).push(
            Routes.azkar,
            extra: {
              "endpoint": Endpoints.morningazkarsEndpoint,
              "title": "اذكار الصباح",
            },
          );
        break;
      case 1:
        GoRouter.of(context).push(
            Routes.azkar,
            extra: {
              "endpoint": Endpoints.eveningazkarsEndpoint,
              "title": "اذكار المساء",
            },
          );
        break;
      case 2:
     GoRouter.of(context).push(
            Routes.azkar,
            extra: {
              "endpoint": Endpoints.beforesleepazkersEndpoint,
              "title": "اذكار النوم",
            
            },
          );
        break;
      case 3:
       GoRouter.of(context).push(
            Routes.azkar,
            extra: {
              "endpoint": Endpoints.bathroomazkarEndpoint,
              "title": "اذكار الخلاء",
            },
          );
        break;
         case 4:
      GoRouter.of(context).push(
            Routes.azkar,
            extra: {
              "endpoint": Endpoints.wedooazkarEndpoint,
              "title": "اذكار الصلاه",
            },
          );
        break;
         case 5:
      GoRouter.of(context).push(
            Routes.azkar,
            extra: {
              "endpoint": Endpoints.aftersleepazkersEndpoint,
             "title": "اذكار بعد الصلاة",
            },
          );
        break;
           case 6:
      GoRouter.of(context).push(
            Routes.prayes,
          
          );
        break;
      default:
        // Handle other cases or do nothing
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16,bottom: 10),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1.6,
        ),
        itemCount: azkarItems.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => handleNavigation(index),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.thirdcolor,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: AppColors.maincolor, width: 2.w),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(azkarItems[index]['icon'], color: AppColors.secondcolor),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        azkarItems[index]['title'],
                        style: TextStyles.text20.copyWith(
                          color: AppColors.maincolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
