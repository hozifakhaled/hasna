import 'package:flutter/material.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';

class ColumnTextAndnumberCounter extends StatelessWidget {
  const ColumnTextAndnumberCounter({
    super.key,
    required this.text,
    required this.number,
  });
  final String text;
  final String number;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyles.text15.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(number, style: TextStyles.text15.copyWith(color: Colors.white)),
      ],
    );
  }
}
