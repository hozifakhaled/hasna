import 'package:flutter/material.dart';
import 'package:hasna/constants/images.dart';
import 'package:hasna/core/widgets/custom_appbar1.dart';
import 'package:hasna/features/hadiths/presentation/widgets/fiqh_container.dart';

class FiqhPage extends StatelessWidget {
  final String fiqh;

  const FiqhPage({super.key, required this.fiqh});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                Assets.imagesOnbooardingimage,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                CustomAppbar1(
                  title: 'الفقه',
                  image: Assets.imagesIconinappbar,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: FiqhContainer(fiqhText: fiqh),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
