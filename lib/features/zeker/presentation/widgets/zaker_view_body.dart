import 'package:flutter/material.dart';
import 'package:hasna/features/zeker/presentation/widgets/circal_number_zaker.dart';
import 'package:hasna/features/zeker/presentation/widgets/column_text_zaketr.dart';
import 'package:hasna/features/zeker/presentation/widgets/zaker_bottom_bar.dart';

class ZakerViewBody extends StatelessWidget {
  const ZakerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ColumnTextZaker(),
        Positioned(bottom: 0, child: ZakerBottomBar()),
        CircalNumberZaker(),
      ],
    );
  }
}

