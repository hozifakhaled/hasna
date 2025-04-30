import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasna/constants/images.dart';
import 'package:hasna/features/prayers/presentation/widgets/list_item_prayer.dart';

class PrayersViewBody extends StatelessWidget {
  const PrayersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Stack(
        children: [
          /// صورة الخلفية ستظل ثابتة
          Positioned.fill(
            top: 200,
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                Assets.imagesBearish1,
                width: 200.w,
                fit: BoxFit.contain,
              ),
            ),
          ),

          /// المحتوى القابل للتمرير
          CustomScrollView(
           
            slivers: [
             
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 10.h,
                ),
              ),
             SliverToBoxAdapter(child: ListItemPrayer())
                   
            ],
          ),
        ],
      ),
    );
  }
}
