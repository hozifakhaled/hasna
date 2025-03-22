import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';
import 'package:hasna/core/themeing/colors.dart';
import 'package:hasna/core/widgets/container_in_zekrwidget.dart';
import 'package:hasna/core/widgets/custome_appbar2.dart';

class TasbihaViewBody extends StatelessWidget {
  const TasbihaViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    List icons =[
      Icons.settings,
      Icons.sync,
      Icons.draw,
      Icons.save,    
    ];
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomeAppbar2(title: 'تسبيحه'),
            Expanded(
              child: Center(
                child: Container(
                  width: 180.w,
                  height: 180.h,
                  decoration: BoxDecoration(
                    color: AppColors.thirdcolor,
                    borderRadius: BorderRadius.all(Radius.circular(20.r)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                    child: Column(
                      children: [
                        Container(
                          width: 130.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.secondcolor, width: 2),
                            color: AppColors.light,
                            borderRadius: BorderRadius.all(Radius.circular(20.r)),
                          ),
                          child: Center( // يضمن توسيط النص داخل الـ Container
                            child: Text(
                              '1300',
                              style: TextStyles.text20.copyWith(
                                  color: AppColors.maincolor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(height: 50.h),
                        Container(
                          width: 60.w,
                          height: 60.h,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.secondcolor, width: 2),
                            color: AppColors.light,
                            boxShadow:  [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(50.r)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          SizedBox(
  height: 80.h, // 🔹 تحديد ارتفاع مناسب للـ ListView
  child: ListView.builder(
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    itemCount: 4,
    itemBuilder: (context, index) => Padding(
      padding: EdgeInsets.symmetric(horizontal: 11.w,vertical: 12.h),
      child: ContainerInZekrWidget(
        width: 60,
        height: 60,
        color: AppColors.thirdcolor,
        child:icons[index] == Icons.play_arrow ? Icon(icons[index],color: AppColors.light,) : Icon(icons[index],color: AppColors.secondcolor,),
      ),
    ),
  ),
),

          ],
        ),
      ),
    );
  }
}
