import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasna/core/routing/app_routing.dart';
import 'package:hasna/core/themeing/themeapp.dart';

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
        theme: themeApp,
         locale: Locale('ar', 'EG'), // تعيين اللغة إلى العربية (مصر)
  supportedLocales: [
    Locale('en', 'US'), // اللغة الإنجليزية
    Locale('ar', 'EG'), // اللغة العربية
  ],
  localizationsDelegates: [
    // ... app-specific localization delegate[s] here
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
        debugShowCheckedModeBanner: false,
        title: 'Hasna',
        routerConfig: AppRouting.router,
      ),
    );
  }
}

