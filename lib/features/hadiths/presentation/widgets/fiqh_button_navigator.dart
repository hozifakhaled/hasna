import 'package:flutter/material.dart';
import 'package:hasna/core/themeing/colors.dart';
import 'package:hasna/features/hadiths/presentation/widgets/button_in_hadith.dart';
import 'package:hasna/features/hadiths/presentation/widgets/fiqh_view_body.dart';

class FiqhButtonNavigator extends StatelessWidget {
  const FiqhButtonNavigator({super.key, required this.fiqh});

  final String fiqh;

  @override
  Widget build(BuildContext context) {
    return ButtonInHadith(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => FiqhPage(fiqh: fiqh),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              const begin = Offset(0.0, 1.0);
              const end = Offset.zero;
              const curve = Curves.easeInOut;
              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              return SlideTransition(position: animation.drive(tween), child: child);
            },
          ),
        );
      },
      gradient: LinearGradient(
        colors: [AppColors.thirdcolor, AppColors.maincolor.withOpacity(0.5)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
  }
}
