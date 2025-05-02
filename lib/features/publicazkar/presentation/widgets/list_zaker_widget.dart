import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasna/features/publicazkar/data/models/tasabih_model.dart';
import 'package:hasna/features/publicazkar/presentation/widgets/zekr_wiget.dart';

class ListZakerWidget extends StatelessWidget {
  const ListZakerWidget({
    super.key, required this.tasabih,
  });
 final List <TasabihModel> tasabih ;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
        horizontal: 10.w,
      ),
      itemCount:tasabih.length,
      itemBuilder: (context, index) {
        final tasbih = tasabih[index];
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0),
          child: ZekrWiget(tasabih: tasbih),
        );
      },
    );
  }
}