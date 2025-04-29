import 'package:flutter/material.dart';
import 'package:hasna/core/widgets/column_text_zaketr.dart';

class ZakerViewBody extends StatelessWidget {
  const ZakerViewBody({super.key, required this.zaker, required this.asnad, required this.numberofzaker, required this.onTap});

 final String zaker ;
 final String numberofzaker  ;
 final String asnad ;



 final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ColumnTextZaker( onTap: onTap,zaker: zaker, numberofzaker: numberofzaker, asnad: asnad,);
  }
}

