import 'package:flutter/material.dart';
import 'package:hasna/constants/images.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';
import 'package:hasna/core/themeing/colors.dart';

class ZekrWiget extends StatelessWidget {
  const ZekrWiget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.thirdcolor,
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(Assets.imagesCornertopleft),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'أَعُوذُ بِكَلِمَاتِ اللهِ التَّامَّةِ مِنْ شَرِّ مَا خَلَقَ',
                        style: TextStyles.text20.copyWith(
                          color: AppColors.maincolor,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'عدد التسبيح 555',
                        style: TextStyles.text18.copyWith(
                          color: AppColors.maincolor,
                          fontSize: 16
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(Assets.imagesMorevertical),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
