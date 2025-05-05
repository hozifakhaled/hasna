import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasna/constants/images.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';
import 'package:hasna/core/themeing/colors.dart';

class ImportanceContainer extends StatelessWidget {
  const ImportanceContainer({super.key, required this.importance});

  final String importance;

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
    final screenWidth = MediaQuery.of(context).size.width - 64;
    final lineCount = _calculateLineCount(importance, textStyle, screenWidth);
    final bool isLongText = lineCount > 4;

    return Container(
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
          Positioned(
              top: -10,
              left: -10,
              child: Image.asset(Assets.imagesCornertopleft, width: 40.w)),
          Positioned(
              bottom: -10,
              left: -10,
              child: Image.asset(Assets.imagesCornerleftbottom, width: 55.w)),
          Positioned(
              top: -10,
              right: -10,
              child: Image.asset(Assets.imagesCornertopright, width: 50.w)),
          Positioned(
              bottom: -10,
              right: -10,
              child: Image.asset(Assets.imagesCornerbottomright, width: 40.w)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'الأهمية',
                style: textStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.secondcolor,
                ),
              ),
              SizedBox(height: 8.h),
              isLongText
                  ? ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: 220.h),
                      child: SingleChildScrollView(
                        child: Text(
                          importance,
                          style: textStyle,
                          softWrap: true,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    )
                  : Text(
                      importance,
                      style: textStyle,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
                    ),
              SizedBox(height: 10.h),
            ],
          ),
        ],
      ),
    );
  }
}
