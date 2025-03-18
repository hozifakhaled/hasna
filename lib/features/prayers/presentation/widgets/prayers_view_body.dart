import 'package:flutter/material.dart';
import 'package:hasna/core/widgets/custome_appbar2.dart';

class PrayersViewBody extends StatelessWidget {
  const PrayersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomeAppbar2(title: 'أدعية'),
          
        ],
      ),
    );
  }
}