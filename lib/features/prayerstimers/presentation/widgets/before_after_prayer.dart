import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasna/constants/images.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';
import 'package:hasna/core/themeing/colors.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class BeforeAndAfterPrayer extends StatefulWidget {
  const BeforeAndAfterPrayer({
    super.key, required this.prayname, required this.praytime, required this.praytimeday,
  });
  final String prayname;
  final String praytime;
  final String praytimeday;

  @override
  State<BeforeAndAfterPrayer> createState() => _BeforeAndAfterPrayerState();
}

class _BeforeAndAfterPrayerState extends State<BeforeAndAfterPrayer> {
String getPrayerName(String prayerName) {
  if (prayerName == ' fajr ') {
    return 'الفجر';
  } else if (prayerName == 'sunrise') {
    return 'الشروق';
  } else if (prayerName == 'dhuhr') {
    return 'الظهر';
  } else if (prayerName == 'asr') {
    return 'العصر';
  } else if (prayerName == 'maghrib') {
    return 'المغرب';
  } else if (prayerName == 'isha') {
    return 'العشاء';
  } else {
    return 'غير معروف';
  }
}
late DateTime date;

// زود ساعة
late DateTime updated;

  // تنسيق بالعربي (مثلاً: ٠٤:٣١ م)
  late String formatted;

  @override
  void initState() {
    super.initState();
    date = DateTime.parse(widget.praytime);
    updated = date.add(Duration(hours: 1));
    final formatter = DateFormat(' hh:mm ', );
    formatted = formatter.format(updated);
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
         decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.maincolor,
          ),
          
        
          height: 130.h,
          width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.praytimeday,
            style: TextStyles.text15.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w100,
            ),
          ),
          SizedBox(height: 10), // بديل spacing
          Text(
            getPrayerName ( widget.prayname),
            style: TextStyles.text15.copyWith(
              color: AppColors.thirdcolor,
            ),
          ),
          SizedBox(height: 10),
          Text(
            formatted,
            style: TextStyles.text20.copyWith(),
          ),
        ],
          ),
        ),
        
        ),
    Positioned(
      bottom: 3,
      right: 3,
      child: Image.asset(Assets.imagesCornerbottomright)),
      Positioned(
      bottom: 3,
      left: 3,
      child: Image.asset(Assets.imagesCornerleftbottom))
      ],
    );
  }
}
