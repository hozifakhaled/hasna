import 'package:flutter/material.dart';
import 'package:hasna/core/extention/extention.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';
import 'package:hasna/core/themeing/colors.dart';

class CustomCircleProgress extends StatefulWidget {
  const CustomCircleProgress({super.key, required this.value});
final int value ;
  @override
  // ignore: library_private_types_in_public_api
  _CustomCircleProgressState createState() => _CustomCircleProgressState();
}

class _CustomCircleProgressState extends State<CustomCircleProgress> {
  late int value;
  late int value2;

  @override
  void initState() {
    super.initState();
    value = widget.value; 
    value2 = widget.value;
  }

  void decreaseValue() {
    setState(() {
      if (value > 1) {
        value--; // تقليل العدد حتى لا يقل عن 1
      } else {
        value = value2;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double percentage = (value / 100).clamp(0.0, 1.0); // تحديد نسبة الرسم

    return GestureDetector(
      onTap: decreaseValue, // عند الضغط يتم تقليل القيمة
      child: SizedBox(
        width: context.width * 0.5,
        height: context.width * 0.5,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // الخلفية
            Container(
              width: context.width * 0.5,
              height: context.width * 0.5,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.maincolor, width: 4),
                color: AppColors.thirdcolor,
                shape: BoxShape.circle,
              ),
            ),
            // الرسم المخصص للنسبة
            Positioned.fill(
              child: CustomPaint(painter: CircleProgressPainter(percentage)),
            ),
            // النص في المنتصف
            Text(
              '$value',
              style: TextStyles.text35.copyWith(color: AppColors.secondcolor),
            ),
          ],
        ),
      ),
    );
  }
}
class CircleProgressPainter extends CustomPainter {
  final double percentage;
  CircleProgressPainter(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..color =
              AppColors.secondcolor// لون الجزء المرسوم
          ..strokeWidth = 6
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    double startAngle = -90 * (3.14159 / 180); // زاوية البداية (من الأعلى)
    double sweepAngle =
        percentage * 360 * (3.14159 / 180); // زاوية الجزء المرسوم

    canvas.drawArc(
      Rect.fromCircle(center: size.center(Offset.zero), radius: size.width / 2),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}