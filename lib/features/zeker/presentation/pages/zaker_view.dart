import 'package:flutter/material.dart';
import 'package:hasna/features/zeker/presentation/widgets/zaker_view_body.dart';

class ZakerView extends StatelessWidget {
  const ZakerView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Scaffold(
        body: ZakerViewBody(),
      ),
    );
  }
}