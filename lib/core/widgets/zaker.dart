import 'package:flutter/material.dart';
import 'package:hasna/core/widgets/zaker_view_body.dart';

class Zaker extends StatelessWidget {
  const Zaker({
    super.key,
   
    required this.zaker,
    required this.asnad,
    required this.totalAzker,
    required this.currentAzker,
    required this.number,
    required this.numberofzaker, required this.onTap, required this.audioUrl,
  });
 
  final String zaker;
  final String asnad;
  final int totalAzker;
  final int currentAzker;
  final int number;
  final String audioUrl;
  final String numberofzaker;
   final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ZakerViewBody(
          asnad: asnad,
          zaker: zaker,
          totalAzker: totalAzker,
       
          number: number,
          numberofzaker: numberofzaker,
          currentAzker: currentAzker,
          onTap: onTap, audioUrl: audioUrl,
        ),
      ),
    );
  }
}
