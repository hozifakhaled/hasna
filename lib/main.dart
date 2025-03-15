import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasna/core/routing/app_routing.dart';

void main() {
  runApp(const Hasna());
}

class Hasna extends StatelessWidget {
  const Hasna({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
       designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Hasna',
        routerConfig: AppRouting.router,
      ),
    );
  }
}

