import 'package:flutter/material.dart';
import 'package:hasna/core/widgets/circal_number_zaker.dart';
import 'package:hasna/core/widgets/column_text_zaketr.dart';
import 'package:hasna/core/widgets/zaker_bottom_bar.dart';

class ZakerViewBody extends StatelessWidget {
  const ZakerViewBody({super.key, required this.zaker, required this.asnad, required this.totalAzker, required this.currentAzker, required this.number, required this.numberofzaker, required this.onTap});

 final String zaker ;
 final String numberofzaker  ;
 final String asnad ;
 final int totalAzker ;
 final int currentAzker ;
 final int number ;
 final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: ColumnTextZaker( onTap: onTap,zaker: zaker, numberofzaker: numberofzaker, asnad: asnad,)),
        Positioned(bottom: 0, child: ZakerBottomBar(totalAzker: totalAzker, currentAzker: currentAzker,)),
    CircalNumberZaker(number: number, onTap: onTap,),
      ],
    );
  }
}

