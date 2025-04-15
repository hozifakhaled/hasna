import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasna/core/databases/cache/cache_helper.dart';
import 'package:hasna/core/di/getit.dart';
import 'package:hasna/core/routing/app_routing.dart';
import 'package:hasna/core/themeing/themeapp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // مهم لتأجيل التشغيل
   CacheHelper().init(); // استدعاء دالة إعداد موفر الخدمة
   setup(); // استدعاء الإعدادات وانتظار تهيئة SharedPreferences

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
        locale: const Locale('ar', 'EG'),
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ar', 'EG'),
        ],
        localizationsDelegates: const [
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
