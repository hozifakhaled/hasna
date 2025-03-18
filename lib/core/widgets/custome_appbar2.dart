import 'package:flutter/material.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';

class CustomeAppbar2 extends StatelessWidget {
  const CustomeAppbar2({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          /// أيقونة الرجوع إلى الخلف
         
          
          /// المسافة بين الأيقونة والعنوان
          Expanded(
            child: Center(
              child: Text(
                title,
                style: TextStyles.text21
              ),
            ),
          ),
          Icon(Icons.arrow_forward, color: Colors.white),
          
          /// عنصر شفاف ليوازن الأيقونة على الطرف الآخر
          Opacity(
            opacity: 0,
            child: Icon(Icons.arrow_forward, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
