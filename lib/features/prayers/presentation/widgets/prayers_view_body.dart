import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasna/constants/images.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';
import 'package:hasna/core/themeing/colors.dart';
import 'package:hasna/core/widgets/custome_appbar2.dart';

class PrayersViewBody extends StatelessWidget {
  const PrayersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Stack(
            children: [
              /// صورة الخلفية ستظل ثابتة
              Positioned.fill(
                top: 200,
               
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    Assets.imagesBearish1,
                    width: 200.w,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              /// المحتوى القابل للتمرير
              Column(
                children: [
                  CustomeAppbar2(title: 'أدعية'),
                  Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric( vertical: 20.h),
                      itemCount: 20, // عدد الأدعية
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(16.w),
                          child: Text(
                            "اللهم لك أسلمت، وبك آمنت، وعليك توكلت، وإليك خاصمت، وبك حاكمت، فاغفر لي ما قدمت وما أخرت، وأسررت وأعلنت، وما أنت أعلم به مني، لا إله إلا أنت",
                            style: TextStyles.text20.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /// Container رمادي على اليمين
                            Container(
                              width: 20.w,
                              height: 20.h,
                              decoration: BoxDecoration(
                                color: AppColors.thirdcolor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                                                         
                            Container(
                              width: 20.w,
                              height: 20.h,
                              decoration: BoxDecoration(
                                color: AppColors.thirdcolor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
