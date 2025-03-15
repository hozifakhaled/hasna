import 'package:flutter/material.dart';
import 'package:hasna/core/routing/app_routing.dart';

void main() {
  runApp(const Hasna());
}

class Hasna extends StatelessWidget {
  const Hasna({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Hasna',
      routerConfig: AppRouting.router,
    );
  }
}

