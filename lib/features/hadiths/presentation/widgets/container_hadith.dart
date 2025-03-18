import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasna/constants/images.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';
import 'package:hasna/core/themeing/colors.dart';

class ContainerHadith extends StatelessWidget {
  const ContainerHadith({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.thirdcolor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,

              child: Image.asset(
                Assets.imagesCornertopleft,
                fit: BoxFit.fill,
                width: 40.w,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,

              child: Image.asset(
                Assets.imagesCornerleftbottom,
                fit: BoxFit.fill,
                width: 55.w,
              ),
            ),

            Positioned(
              top: 0,
              right: 0,

              child: Image.asset(
                Assets.imagesCornertopright,
                fit: BoxFit.fill,
                width: 50.w,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,

              child: Image.asset(
                Assets.imagesCornerbottomright,
                fit: BoxFit.fill,
                width: 40.w,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 20.h,
                children: [
                  Text('  نص الحديث وتفسيره:', style: TextStyles.text15),

                  Text(
                    'عن أبي هريرة رضي الله عنه أن رسول الله ﷺ قال:«من كان يؤمن بالله واليوم الآخر فليقل خيرًا أو ليصمت، ومن كان يؤمن بالله واليوم الآخر فليكرم جاره، ومن كان يؤمن بالله واليوم الآخر فليكرم ضيفه»',
                    style: TextStyles.text15,
                    softWrap: true,
                    maxLines: null,
                    overflow: TextOverflow.visible,
                  ),
                  Text(
                    'في هذا الحديث يوجه النبي ﷺ ثلاث وصايا عظيمة تدل على كمال الإيمان وحسن الأخلاق: الكلام الطيب أو الصمت:المسلم مطالب بأن ينتقي كلماته، فإن كان ما سيقوله خيرًا فليقله، وإلا فالأفضل أن يصمت.وهذا يدل على أهمية ضبط اللسان لأن الكلمة قد تكون سببًا في الخير أو الشر.',
                    style: TextStyles.text15,
                    softWrap: true,
                    maxLines: null,
                    overflow: TextOverflow.visible,
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
