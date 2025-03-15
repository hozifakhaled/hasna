import 'package:flutter/material.dart';
import 'package:hasna/core/routing/app_routing.dart';

void main() {
  runApp(const Hasna());
}

class Hasna extends StatelessWidget {
  const Hasna({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Hasna',
      routerConfig: AppRouting.router,
     // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

