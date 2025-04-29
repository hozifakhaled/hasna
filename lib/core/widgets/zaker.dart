import 'package:flutter/material.dart';
import 'package:hasna/core/widgets/zaker_view_body.dart';

class Zaker extends StatelessWidget {
  const Zaker({
    super.key,

    required this.zaker,
    required this.asnad,
  
  
    required this.numberofzaker,
    required this.onTap,
  
  });

  final String zaker;
  final String asnad;

 
 
  final String numberofzaker;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ZakerViewBody(
          asnad: asnad,
          zaker: zaker,
          numberofzaker: numberofzaker,
          onTap: onTap,
        ),
      ),
    );
  }
}
