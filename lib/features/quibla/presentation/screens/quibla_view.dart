import 'package:flutter/material.dart';

class QuiblaView extends StatelessWidget {
  const QuiblaView({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text("اتجاه القبلة")),
      body: Center(
        child: Text(
          "اتجاه القبلة هنا",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}