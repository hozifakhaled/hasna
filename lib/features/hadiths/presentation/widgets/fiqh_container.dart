import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasna/constants/images.dart';
import 'package:hasna/core/themeing/colors.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';
import 'package:hasna/features/hadiths/presentation/widgets/fiqh_content.dart';

class FiqhContainer extends StatelessWidget {
  final String fiqhText;

  const FiqhContainer({super.key, required this.fiqhText});

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
    final screenWidth = MediaQuery.of(context).size.width - 64 - 32;
    final lineCount = _calculateLineCount(fiqhText, textStyle, screenWidth);

    final double minHeight = 150.h;
    final double calculatedHeight = (lineCount * 20.0 + 80).h;
    final double containerHeight = calculatedHeight > minHeight ? calculatedHeight : minHeight;
    final bool isVeryLongText = lineCount > 15;
    final double maxHeight = isVeryLongText ? 400.h : containerHeight;

    return Container(
      constraints: BoxConstraints(
        minHeight: minHeight,
        maxHeight: isVeryLongText ? maxHeight : double.infinity,
      ),
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
          Positioned(top: -10, left: -10, child: _cornerImage(Assets.imagesCornertopleft, 40.w)),
          Positioned(bottom: -10, left: -10, child: _cornerImage(Assets.imagesCornerleftbottom, 55.w)),
          Positioned(top: -10, right: -10, child: _cornerImage(Assets.imagesCornertopright, 50.w)),
          Positioned(bottom: -10, right: -10, child: _cornerImage(Assets.imagesCornerbottomright, 40.w)),

          isVeryLongText
              ? SingleChildScrollView(child: FiqhContent(fiqh: fiqhText))
              : FiqhContent(fiqh: fiqhText),
        ],
      ),
    );
  }

  Widget _cornerImage(String asset, double width) {
    return Image.asset(
      asset,
      fit: BoxFit.fill,
      width: width,
    );
  }
}
