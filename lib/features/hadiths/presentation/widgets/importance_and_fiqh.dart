/*import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasna/constants/images.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';
import 'package:hasna/core/themeing/colors.dart';
import 'package:hasna/core/widgets/custom_appbar1.dart';
import 'package:hasna/features/hadiths/presentation/widgets/button_in_hadith.dart';
import 'package:hasna/features/hadiths/presentation/widgets/fiqh_view_body.dart';

class ImportanceAndFiqh extends StatelessWidget {
  const ImportanceAndFiqh({super.key, required this.importance, required this.fiqh});

  final String importance;
  final String fiqh;

  // حساب عدد السطور للنص
  int _calculateLineCount(String text, TextStyle style, double maxWidth) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.rtl,
      maxLines: null,
    )..layout(maxWidth: maxWidth);

    return textPainter.computeLineMetrics().length;
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyles.text15;
    final screenWidth = MediaQuery.of(context).size.width - 64; // عرض الشاشة مع مراعاة الهوامش والـ padding
    final lineCount = _calculateLineCount(importance, textStyle, screenWidth);
    
    final bool isLongText = lineCount > 4;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppbar1(
              title: 'الضرورة',
              image: Assets.imagesIconinappbar,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    children: [
                      // Container للأهمية مع ارتفاع متكيف
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: AppColors.thirdcolor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            // الزخارف في الزوايا
                            Positioned(
                              top: -10,
                              left: -10,
                              child: Image.asset(
                                Assets.imagesCornertopleft,
                                fit: BoxFit.fill,
                                width: 40.w,
                              ),
                            ),
                            Positioned(
                              bottom: -10,
                              left: -10,
                              child: Image.asset(
                                Assets.imagesCornerleftbottom,
                                fit: BoxFit.fill,
                                width: 55.w,
                              ),
                            ),
                            Positioned(
                              top: -10,
                              right: -10,
                              child: Image.asset(
                                Assets.imagesCornertopright,
                                fit: BoxFit.fill,
                                width: 50.w,
                              ),
                            ),
                            Positioned(
                              bottom: -10,
                              right: -10,
                              child: Image.asset(
                                Assets.imagesCornerbottomright,
                                fit: BoxFit.fill,
                                width: 40.w,
                              ),
                            ),
                            
                            // المحتوى
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min, // مهم لجعل الـ Column يأخذ الحجم الأصغر المطلوب
                              children: [
                                Text(
                                  'الأهمية',
                                  style: TextStyles.text15.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.secondcolor,
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                isLongText
                                    ? ConstrainedBox(
                                        constraints: BoxConstraints(
                                          maxHeight: 220.h, // حد أقصى للارتفاع للنص الطويل
                                        ),
                                        child: SingleChildScrollView(
                                          child: Text(
                                            importance,
                                            style: textStyle,
                                            softWrap: true,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      )
                                    : Text(
                                        importance,                                        style: textStyle,
                                        softWrap: true,
                                        textAlign: TextAlign.center,
                                      ),
                                SizedBox(height: 10.h),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      // زر الفقه
                      ButtonInHadith(
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) => FiqhPage(fiqh: fiqh),
                              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                const begin = Offset(0.0, 1.0);
                                const end = Offset.zero;
                                const curve = Curves.easeInOut;

                                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                var offsetAnimation = animation.drive(tween);

                                return SlideTransition(position: offsetAnimation, child: child);
                              },
                            ),
                          );
                        },
                        gradient: LinearGradient(
                          colors: [
                            AppColors.thirdcolor,
                            AppColors.maincolor.withOpacity(0.5),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasna/constants/images.dart';
import 'package:hasna/core/widgets/custom_appbar1.dart';
import 'package:hasna/features/hadiths/presentation/widgets/importance_container.dart';
import 'package:hasna/features/hadiths/presentation/widgets/fiqh_button_navigator.dart';

class ImportanceAndFiqh extends StatelessWidget {
  const ImportanceAndFiqh({super.key, required this.importance, required this.fiqh});

  final String importance;
  final String fiqh;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppbar1(title: 'الضرورة', image: Assets.imagesIconinappbar),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ImportanceContainer(importance: importance),
                    SizedBox(height: 20.h),
                    FiqhButtonNavigator(fiqh: fiqh),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
